import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  AuthCubit({
    FirebaseAuth? auth,
    FirebaseFirestore? firestore,
  })  : _auth = auth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance,
        super(AuthState.initial());

  Future<void> checkCurrentUser() async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));

    final user = _auth.currentUser;
    if (user == null) {
      emit(state.copyWith(status: AuthStatus.unauthenticated));
      return;
    }

    try {
      final doc = await _firestore.collection('users').doc(user.uid).get();

      if (!doc.exists) {
        emit(state.copyWith(
          status: AuthStatus.error,
          errorMessage: 'لا توجد بيانات لهذا المستخدم.',
        ));
        return;
      }

      final data = doc.data();
      final role = data?['role'] as String?;
      final accountStatus = data?['accountStatus'] as String?;

      if (role == 'patient') {
        emit(state.copyWith(
          status: AuthStatus.authenticatedPatient,
          userId: user.uid,
          role: role,
          accountStatus: accountStatus,
        ));
      } else if (role == 'nurse') {
        emit(state.copyWith(
          status: AuthStatus.authenticatedNurse,
          userId: user.uid,
          role: role,
          accountStatus: accountStatus,
        ));
      } else {
        emit(state.copyWith(
          status: AuthStatus.error,
          errorMessage: 'نوع المستخدم غير معروف.',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));

    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      final user = credential.user;
      if (user == null) {
        emit(state.copyWith(
          status: AuthStatus.error,
          errorMessage: 'فشل الحصول على هوية المستخدم.',
        ));
        return;
      }

      final doc = await _firestore.collection('users').doc(user.uid).get();

      if (!doc.exists) {
        emit(state.copyWith(
          status: AuthStatus.error,
          errorMessage: 'بيانات المستخدم غير موجودة في قاعدة البيانات.',
        ));
        return;
      }

      final data = doc.data();
      final role = data?['role'] as String?;
      final accountStatus = data?['accountStatus'] as String?;

      if (role == 'patient') {
        emit(state.copyWith(
          status: AuthStatus.authenticatedPatient,
          userId: user.uid,
          role: role,
          accountStatus: accountStatus,
        ));
      } else if (role == 'nurse') {
        emit(state.copyWith(
          status: AuthStatus.authenticatedNurse,
          userId: user.uid,
          role: role,
          accountStatus: accountStatus,
        ));
      } else {
        emit(state.copyWith(
          status: AuthStatus.error,
          errorMessage: 'الدور غير موجود أو غير صحيح.',
        ));
      }
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.message ?? 'حدث خطأ في تسجيل الدخول.',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> registerPatient({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));

    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      final user = credential.user;
      if (user == null) {
        emit(state.copyWith(
          status: AuthStatus.error,
          errorMessage: 'فشل إنشاء حساب المريض.',
        ));
        return;
      }

      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'fullName': name.trim(),
        'email': email.trim(),
        'phone': phone.trim(),
        'role': 'patient',
        'accountStatus': 'approved',
        'createdAt': FieldValue.serverTimestamp(),
      });

      emit(state.copyWith(
        status: AuthStatus.authenticatedPatient,
        userId: user.uid,
        role: 'patient',
        accountStatus: 'approved',
      ));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.message ?? 'حدث خطأ أثناء إنشاء حساب المريض.',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> registerNurse({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String experience,
    required String area,
    required String skills,
  }) async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));

    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      final user = credential.user;
      if (user == null) {
        emit(state.copyWith(
          status: AuthStatus.error,
          errorMessage: 'فشل إنشاء طلب الممرض.',
        ));
        return;
      }

      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'fullName': name.trim(),
        'email': email.trim(),
        'phone': phone.trim(),
        'role': 'nurse',
        'accountStatus': 'pending',
        'experience': experience.trim(),
        'area': area.trim(),
        'skills': skills.trim(),
        'createdAt': FieldValue.serverTimestamp(),
      });

      emit(state.copyWith(
        status: AuthStatus.authenticatedNurse,
        userId: user.uid,
        role: 'nurse',
        accountStatus: 'pending',
      ));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.message ?? 'حدث خطأ أثناء إرسال طلب الممرض.',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    emit(state.copyWith(
      status: AuthStatus.unauthenticated,
      userId: null,
      role: null,
      accountStatus: null,
      errorMessage: null,
    ));
  }
}