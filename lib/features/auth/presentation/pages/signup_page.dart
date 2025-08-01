import 'package:blogapp/bloc/auth_bloc.dart';
import 'package:blogapp/core/common/widgets/loader.dart';
import 'package:blogapp/core/theme/app_pallete.dart';
import 'package:blogapp/core/utils/show_snackbar.dart';
import 'package:blogapp/features/auth/presentation/pages/login_page.dart';
import 'package:blogapp/widgets/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class SignupPage extends StatefulWidget {
    static route()=> MaterialPageRoute(builder: (context) =>  SignupPage());

  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final  _nameController = TextEditingController();
  final  _emailController = TextEditingController();
  final  _passwordController = TextEditingController();

  @override
  void dispose(){
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 400, // Set a max width for large screens
                minHeight: MediaQuery.of(context).size.height - 30, // 30 = 2*15 padding
              ),
              child: IntrinsicHeight(
                child: BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if( state is AuthFailure){
                      showsnackbar(context, state.message);
                    }
                  
                  },
                  builder: (context, state) {
                     if(state is AuthLoading){
                    return const Loader();
                   }
                    return Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Sign Up',
                          style: TextStyle(
                            fontSize:32,
                            fontWeight: FontWeight.w600,
                          ),),
                          SizedBox(height: 15,),
                          AuthField(text: 'Name',Controller: _nameController,),
                          SizedBox(height: 15,),
                          AuthField(text: 'Email',Controller: _emailController,),
                          SizedBox(height: 15,),
                          AuthField(text: 'Password',Controller: _passwordController,
                          isobscure: true,),
                          SizedBox(height: 15,),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width*0.8,
                            decoration: BoxDecoration(
                               gradient: LinearGradient(colors: [
                                AppPallete.gradient1,
                                AppPallete.gradient2,
                               ],
                               begin: Alignment.bottomLeft,
                               end: Alignment.topRight
                               ),
                               borderRadius: BorderRadius.circular(10),
                              
                            ),
                            child: ElevatedButton(onPressed: (){
                              if(_formKey.currentState!.validate()){
                                // Handle sign up logic here
                               context.read<AuthBloc>().add(
                                  AuthSignup(
                                    name: _nameController.text.trim(),
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  ),
                                );
                              }
                              
                            },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:AppPallete.transparentColor,
                            shadowColor    :AppPallete.transparentColor,
                                
                               
                              ),
                              child: Text('Sign Up'),
                            ),
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, LoginPage.route());
                              },
                              child: RichText(text: TextSpan(
                                text: "Already have an account?" ,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppPallete.greyColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' Sign In',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: AppPallete.gradient1,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ]
                              ),
                              
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}