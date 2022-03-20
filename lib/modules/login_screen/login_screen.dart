import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
   //     backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
            'Covid',
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
            icon: const Icon(Icons.menu , size: 30.0,),
          ),
        ],
      ),
      backgroundColor: Colors.blue,
      body: Padding(
        padding: EdgeInsets.all(15.0),
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
                ),
                 SizedBox(
                height: 15.0,
                 ),
              Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35.0,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              // TextFormField(
              //   controller: userController,
              //   keyboardType: TextInputType.name,
              //   decoration: InputDecoration(
              //     labelText: 'Username',
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              TextFormField(
                controller: userController,
                decoration: InputDecoration(
                  labelText: 'username',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
