import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cure_app_3/widget/widget.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _formKey = GlobalKey<FormState>();

  bool _selectedPatient = true;
  bool _isLogin = true;
  bool _loading = false;

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _experienceController = TextEditingController();
  final _areaController = TextEditingController();
  final _skillsController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _experienceController.dispose();
    _areaController.dispose();
    _skillsController.dispose();
    super.dispose();
  }

  Future<void> _handleAuth() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    try {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      if (_isLogin) {
        // تسجيل دخول
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        // إنشاء حساب
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set({
          'uid': credential.user!.uid,
          'fullName': _fullNameController.text.trim(),
          'email': email,
          'phone': _phoneController.text.trim(),
          'role': _selectedPatient ? 'patient' : 'nurse',
          'experience': _experienceController.text.trim(),
          'area': _areaController.text.trim(),
          'skills': _skillsController.text.trim(),
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تمت العملية بنجاح')),
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'حدث خطأ في المصادقة')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('حدث خطأ: $e')),
      );
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  void _goToLoginMode() {
    setState(() {
      _isLogin = true;
    });
  }

  void _goToRegisterMode() {
    setState(() {
      _isLogin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CurePageScaffold(
      location: 'الفيوم، مصر',
      avatarLabel: 'P',
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
          children: [
            const SizedBox(height: 8),
            const Text(
              'حسابي / انضم إلينا',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Color(0xFF00408B),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'سجّل كـ مريض أو ممرض وابدأ رحلة الرعاية المنزلية.',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF424752),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 18),
            CureRoleSwitcher(
              patientLabel: 'مريض',
              nurseLabel: 'ممرض',
              selectedPatient: _selectedPatient,
              onChanged: (value) {
                setState(() => _selectedPatient = value);
              },
            ),
            const SizedBox(height: 18),

            if (_selectedPatient)
              CureAuthCard(
                title: _isLogin ? 'تسجيل الدخول' : 'إنشاء حساب',
                subtitle: _isLogin
                    ? 'ادخل بياناتك للوصول إلى حسابك.'
                    : 'أنشئ حسابًا جديدًا كمريض.',
                fields: [
                  if (!_isLogin)
                    CureTextField(
                      controller: _fullNameController,
                      hintText: 'الاسم الكامل',
                    ),
                  CureTextField(
                    controller: _emailController,
                    hintText: 'البريد الإلكتروني',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  if (!_isLogin)
                    CureTextField(
                      controller: _phoneController,
                      hintText: 'رقم الهاتف',
                      keyboardType: TextInputType.phone,
                    ),
                  CureTextField(
                    controller: _passwordController,
                    hintText: 'كلمة المرور',
                    obscureText: true,
                  ),
                ],
                primaryAction: _isLogin ? 'تسجيل الدخول' : 'إنشاء حساب',
                secondaryAction: _isLogin
                    ? 'ليس لدي حساب'
                    : 'لدي حساب بالفعل',
                onPrimaryAction: _loading ? () {} : _handleAuth,
                onSecondaryAction: () {
                  setState(() => _isLogin = !_isLogin);
                },
              )
            else
              CureJoinCard(
                title: 'انضم كـ ممرض',
                subtitle: 'أرسل بياناتك وسنراجع طلبك خلال فترة قصيرة.',
                fields: [
                  CureTextField(
                    controller: _fullNameController,
                    hintText: 'الاسم الكامل',
                  ),
                  CureTextField(
                    controller: _phoneController,
                    hintText: 'رقم الهاتف',
                    keyboardType: TextInputType.phone,
                  ),
                  CureTextField(
                    controller: _emailController,
                    hintText: 'البريد الإلكتروني',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  CureTextField(
                    controller: _experienceController,
                    hintText: 'سنوات الخبرة',
                    keyboardType: TextInputType.number,
                  ),
                  CureTextField(
                    controller: _areaController,
                    hintText: 'المنطقة السكنية',
                  ),
                  CureTextField(
                    controller: _skillsController,
                    hintText: 'التخصصات والمهارات',
                  ),
                  CureTextField(
                    controller: _passwordController,
                    hintText: 'كلمة المرور',
                    obscureText: true,
                  ),
                ],
                primaryAction: _loading ? 'جاري الإرسال...' : 'إرسال الطلب',
                onPrimaryPressed: _loading ? () {} : _handleAuth,
              ),

            const SizedBox(height: 18),
            const CureContactCard(
              title: 'تواصل معنا',
              items: [
                CureContactItem(label: 'الهاتف', value: '01070203636'),
                CureContactItem(
                  label: 'البريد',
                  value: 'eslam.hamada@cureztyx.com',
                ),
                CureContactItem(
                  label: 'بريد إضافي',
                  value: 'curetechnology.info@gmail.com',
                ),
                CureContactItem(label: 'الموقع', value: 'الفيوم، مصر'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}