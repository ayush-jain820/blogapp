import 'package:blogapp/auth/data/datasources/auth_datasources.dart';
import 'package:blogapp/core/exception/exception.dart';
import 'package:blogapp/core/failure.dart';
import 'package:blogapp/domain/entities/userentity.dart';
import 'package:blogapp/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl  implements AuthRepository{
   final AuthDatasources authdatasources;
    AuthRepositoryImpl(this.authdatasources);
@override
   Future<Either<Failure,user>> signupwithemialandpassword({
    required String name,
    required String email,
    required String password,
  }) async {
  try {
    // ignore: non_constant_identifier_names
    final User = await authdatasources.signupwithemialandpassword(
      email: email,
      password: password,
      name: name,
    );
    return right(User);
  } on ServerException catch (e) {
    return left(Failure(e.message));
  } catch (e) {
    return left(Failure(e.toString()));
  }
}

  @override
  Future<Either<Failure,user>> loginwithemialandpassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();

  }
}