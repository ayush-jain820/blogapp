import 'package:blogapp/core/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
 Future<Either<Failure, String>> signupwithemialandpassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> loginwithemialandpassword({
    required String email,
    required String password,
  });
}
