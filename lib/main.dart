import 'package:covid19/modules/scan_screen/scan_screen.dart';
import 'package:covid19/modules/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'modules/login_screen/login_screen.dart';
import 'modules/sign_up_screen/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}