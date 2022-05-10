import 'package:covid19/modules/login_screen/cubit/login_cubit.dart';
import 'package:covid19/modules/login_screen/cubit/login_states.dart';
import 'package:covid19/modules/sign_up_screen/sign_up_screen.dart';
import 'package:covid19/shared/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layouts/home_layout/home_layout.dart';
import '../../shared/components/components.dart';
import '../forget_passowrd_screen/forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar:  AppBar(
          backgroundColor: Colors.white,
          elevation: 1.0,
          title: Text(
              'LOGIN',
            style: TextStyle(
              color: DarkBlueColor,
              fontSize: 27.0,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: ()
            {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios , color: DarkBlueColor,),
          ),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Image(
              image: AssetImage(
                'assets/icons/Component1.png',
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child:SingleChildScrollView(
                  child: Form(
                    key: FormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 40.0,
                        ),
                        DefaultFormFeild(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            label: 'Email Address',
                            prefix: Icons.email_outlined,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Email Address must not be empty';
                              }
                              return null;
                            }
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        DefaultFormFeild(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            label: 'Password',
                            prefix: Icons.lock,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Password must not be empty';
                              }
                              return null;
                            }
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextButton(
                          onPressed: (){
                            navigator(context, ForgetPasswordScreen());
                          },
                          child: Center(
                            child: Text(
                              'Forget Password?',
                              style: TextStyle(
                                color:DarkBlueColor,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: 50.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: TealColor,
                              borderRadius: BorderRadius.circular(6.0)
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: BlocBuilder<LoginCubit,LoginStates>(
                            builder: (context, state) => MaterialButton(
                              onPressed: ()
                              {
                                if(FormKey.currentState!.validate())
                                  {
                                    LoginCubit.get(context).userLogin(email: emailController.text, password: passwordController.text).then((value) {
                                      AppCubit.get(context).getUserData().then((value) {
                                        navigatorAndFinish(context, const HomeLayout());
                                      });
                                    });
                                  }
                              },
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                color:LightGreyColor,
                                  fontSize: 20.0
                              ),
                            ),
                            TextButton(
                              onPressed: (){
                                navigator(context, SignUpScreen());
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color:DarkBlueColor,
                                    fontSize: 22.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 75.0,
                            alignment: AlignmentDirectional.bottomCenter,
                            child: Image(
                              image: AssetImage(
                                'assets/icons/Component2.png',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
