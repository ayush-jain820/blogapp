import 'package:blogapp/core/failure.dart';
import 'package:blogapp/core/usecases/uses_cases.dart';
import 'package:blogapp/domain/entities/userentity.dart';
import 'package:blogapp/repositories/auth_repository_impl.dart';
import 'package:fpdart/fpdart.dart';

class UserSignup implements usecase<user,UserSignupParams > {
  final AuthRepositoryImpl authRepository;

  UserSignup({required this.authRepository});
  @override
  Future<Either<Failure,user>> call(UserSignupParams params) async{
    return  await authRepository.signupwithemialandpassword(
      name: params.name,
      email: params.email,
      password: params.password
    );
    
  }

}

class UserSignupParams {
  final String name;
  final String email;
  final String password;

  UserSignupParams({ required this.name, required this.email, required this.password});
}