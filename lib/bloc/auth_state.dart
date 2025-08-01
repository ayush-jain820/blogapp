part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}


final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState{
  // ignore: non_constant_identifier_names
  final user? User;

  // ignore: non_constant_identifier_names
  AuthSuccess({ this.User});
}


final class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}
