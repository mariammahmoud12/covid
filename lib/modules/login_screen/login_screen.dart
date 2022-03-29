import 'dart:ui';
import 'package:covid19/modules/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid19/shared/components/components.dart';

import '../careers/carrers_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var userController = TextEditingController();

  var passwordController = TextEditingController();

  bool isRemember = false;

  // var blueColor = Color(0xff3db2ff);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: blueColor,
        elevation: 0.0,
        title: const Text(
            'Covid',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 6.0,),
          child: Image(
            image: AssetImage('assets/icons/logo.png'),
          ),
        ),
        actions: [
          IconButton(
            onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CareersScreen()));
            },
            icon: const Icon(Icons.menu , size: 30.0,color: Colors.white,),
          ),
        ],
      ),
      backgroundColor: blueColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image(
                  image: AssetImage(
                      'assets/icons/login_1.png'
                  ),
                ),
                width: double.infinity,
                height: 250.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: userController,
                decoration: InputDecoration(
                  labelText: 'username',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: ()
                    {
                      setState(() {
                        isRemember = !isRemember;
                      });
                    },
                    icon: isRemember ? Icon(Icons.check_circle) : Icon(Icons.check_circle_outline),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Remember me',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: indigoColor,
                    borderRadius: BorderRadius.circular(35.0)
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: MaterialButton(
                  onPressed: (){ },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                        color: goldColor,
                        fontSize: 20.0
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      color: Colors.white,
                        fontSize: 15.0
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color:indigoColor,
                          fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
