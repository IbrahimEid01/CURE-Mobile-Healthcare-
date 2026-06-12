import 'package:flutter/foundation.dart';

enum AuthStatus {
  initial,
  loading,
  authenticatedPatient,
  authenticatedNurse,
  unauthenticated,
  error,
}

@immutable
class AuthState {
  final AuthStatus status;
  final String? userId;
  final String? role;
  final String? accountStatus;
  final String? errorMessage;

  const AuthState({
    required this.status,
    this.userId,
    this.role,
    this.accountStatus,
    this.errorMessage,
  });

  factory AuthState.initial() {
    return const AuthState(status: AuthStatus.initial);
  }

  AuthState copyWith({
    AuthStatus? status,
    String? userId,
    String? role,
    String? accountStatus,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      userId: userId ?? this.userId,
      role: role ?? this.role,
      accountStatus: accountStatus ?? this.accountStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}