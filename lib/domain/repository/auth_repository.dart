import 'package:blogapp/core/failure.dart';
import 'package:blogapp/domain/entities/userentity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
 Future<Either<Failure, user>> signupwithemialandpassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, user>> loginwithemialandpassword({
    required String email,
    required String password,
  });
}
