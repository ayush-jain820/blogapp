
// ignore_for_file: avoid_types_as_parameter_names

import 'package:blogapp/domain/entities/userentity.dart';
import 'package:blogapp/domain/usecases/user_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignup _usersignup;
  AuthBloc({
    required UserSignup usersignup,
  })  : _usersignup = usersignup,
        super(AuthInitial()) {
    on<AuthSignup>((event, emit)  async{
 final res =   await  _usersignup.call(UserSignupParams(name: event.name, email: event.email, password: event.password));
      
      res.fold(
        (failure) => emit(AuthFailure( failure.message)),
        (user) => emit(AuthSuccess( User :user)),
      );
    });
    

  }
  
}
