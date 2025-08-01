import 'package:blogapp/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:blogapp/auth/data/datasources/auth_datasources.dart';
import 'package:blogapp/core/secrets/app_secrets.dart';
import 'package:blogapp/domain/repository/auth_repository.dart';
import 'package:blogapp/domain/usecases/user_signup.dart';
import 'package:blogapp/repositories/auth_repository_impl.dart';



final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
    serviceLocator.registerLazySingleton(() => supabase.client);

 
  _initAuth();
}
 void _initAuth(){
  
   serviceLocator.registerFactory(()=>AuthDatasourcesImpl(serviceLocator()));

   serviceLocator.registerFactory<AuthRepository>(()=>AuthRepositoryImpl(serviceLocator()));
   serviceLocator.registerFactory<UserSignup>(() => UserSignup(authRepository: serviceLocator()));
   serviceLocator.registerLazySingleton(()=>AuthBloc(usersignup: serviceLocator()));
  }
