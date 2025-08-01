import 'package:blogapp/core/failure.dart';
import 'package:fpdart/fpdart.dart';

// ignore: camel_case_types
abstract interface class usecase<successtype,Params> {
  Future<Either<Failure,successtype>> call(Params params);
}

