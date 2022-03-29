import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:covid19/shared/components/components.dart';

import '../scan_screen/scan_screen.dart';

class SignUpScreen extends StatefulWidget {
   SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
   var userController = TextEditingController();

   var passwordController = TextEditingController();

   var emailController = TextEditingController();

   bool ismale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: blueColor,
        elevation: 0.0,
        title: const Text(
          'Covid',
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.white,
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
              print('Menu Icon is pressed');
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
                      'assets/icons/signup_1.png'
                  ),
                ),
                width: double.infinity,
                height: 250.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'SIGN UP',
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
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: userController,
                decoration: InputDecoration(
                  labelText: 'Username',
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
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Repeat Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: ()
                          {
                            setState(() {
                              ismale = true;
                            });
                          },
                          icon: ismale ? Icon(Icons.check_circle) : Icon(Icons.check_circle_outline),
                          color: indigoColor,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                            'Male',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: ()
                          {
                            setState(() {
                              ismale = false;
                            });
                          },
                          icon: ismale ? Icon(Icons.check_circle_outline) : Icon(Icons.check_circle),
                          color: indigoColor,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Female',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
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
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ScanScreen()));
                  },
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                        color: goldColor,
                        fontSize: 20.0
                    ),
                  ),
                ),
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
