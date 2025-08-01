// ignore_for_file: camel_case_types

import 'package:blogapp/domain/entities/userentity.dart';

class usermodel extends user{
  usermodel({required super.id, required super.name, required super.email});
  factory usermodel.fromJson(Map<String, dynamic> json) {
    return usermodel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }



}