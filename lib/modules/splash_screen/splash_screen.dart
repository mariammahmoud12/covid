
import 'dart:ui';

import 'package:covid19/modules/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid19/shared/components/components.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
                const Image(
                  image: AssetImage(
                    'assets/icons/Component2.png',
                  ),
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

