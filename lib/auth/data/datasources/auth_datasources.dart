import 'package:blogapp/core/exception/exception.dart';
import 'package:blogapp/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthDatasources {
  Future <usermodel> signupwithemialandpassword({
    required String name,
    required String email,
    required String password,
  });
   Future<usermodel> loginWithEmailPassword({
    required String email,
    required String password,
  });
  Future<usermodel?> getCurrentUserData();

  
 


  
}


class AuthDatasourcesImpl implements AuthDatasources {
  final SupabaseClient supabaseClient;
   const AuthDatasourcesImpl(  this.supabaseClient);
  Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<usermodel> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );
      if (response.user == null) {
        throw const ServerException('User is null!');
      }
      return usermodel.fromJson(response.user!.toJson());
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<usermodel> signupwithemialandpassword({
    required String name,
    required String email,
    required String password,
    
  }) async {
    // Implement the signup logic here
    try {
    final response=  await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name,
        },
      );
      
      if(response.user ==null){
        throw const  ServerException( 'user not found');

      }
      // Return a success message or user id as needed
      return response.user!.toJson() as usermodel;
    } catch (e) {
      throw ServerException(e.toString());
      // Handle the error and return an error message
      
    }
  }
  
  @override
  Future<usermodel?> getCurrentUserData() {
    throw UnimplementedError();
  }
}
  