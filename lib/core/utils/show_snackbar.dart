import 'package:flutter/material.dart';

void showsnackbar(BuildContext context, String message){
 ScaffoldMessenger.of(context)..hideCurrentSnackBar..showSnackBar(
   SnackBar(
     content: Text(message),
     duration: const Duration(seconds: 2),
     backgroundColor: Colors.red,
   ),

  );

}