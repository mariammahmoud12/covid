
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
      // appBar: AppBar(
      //   backgroundColor: blueColor,
      //   elevation: 0.0,
      //   title: const Text('Covid'),
      //   leading: const Padding(
      //     padding: EdgeInsets.only(left: 6.0,),
      //     child: Image(
      //       image: AssetImage('assets/icons/logo.png'),
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: ()
      //       {
      //         Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
      //       },
      //       icon: const Icon(Icons.menu , size: 30.0,),
      //     ),
      //   ],
      // ),
      body: Stack(
        children: [
        Image(
          image: AssetImage(
                     'assets/icons/Component1.png',
                   ),
        ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(
                    'assets/icons/Component2.png',
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
              //    textBaseline: TextBaseline.alphabetic,
             //     crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'C',
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
                          'ovid',
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
      // Padding(
      //   padding: const EdgeInsets.all(20.0),
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Text(
      //           'Stay at home &',
      //           style: TextStyle(
      //             fontSize: 45.0,
      //             fontWeight: FontWeight.w900,
      //             color: Colors.white,
      //           ),
      //         ),
      //         SizedBox(
      //           height: 20.0,
      //         ),
      //         // Text(
      //         //   'Get Support',
      //         //   style: TextStyle(
      //         //     fontSize: 45.0,
      //         //     fontWeight: FontWeight.w900,
      //         //     color: redColor,
      //         //   ),
      //         // ),
      //         TextButton(
      //           onPressed: (){
      //             Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
      //           },
      //           child: Text(
      //             'Get Support',
      //             style: TextStyle(
      //             fontSize: 45.0,
      //             fontWeight: FontWeight.w900,
      //             color: redColor,
      //           ),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 40.0,
      //         ),
      //         Image(
      //           image: AssetImage(
      //             'assets/icons/home_1.png'
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

