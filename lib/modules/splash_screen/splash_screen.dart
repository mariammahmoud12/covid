
import 'dart:async';
import 'dart:ui';

import 'package:covid19/modules/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid19/shared/components/components.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    Timer(const Duration(seconds: 3), () {
      navigator(context, LoginScreen());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          const Image(
            image: AssetImage(
              'assets/icons/Component1.png',
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Image(
                    image: AssetImage(
                      'assets/icons/logo2.png',
                    ),
                  ),
                  width: double.infinity,
                  height: 300.0,
                ),
                const SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'L',
                      style: TextStyle(
                        fontSize: 40.0,
                        color:lightTealColor,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                      },
                      child: Text(
                          'ungs',
                        style: TextStyle(
                          fontSize: 35.0,
                          color:DarkBlueColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

