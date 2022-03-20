import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
       // backgroundColor: Colors.blue,
        elevation: 0.0,
        title: const Text('Covid'),
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
      body: Padding(
        padding:const EdgeInsets.all(20.0),
          child:SingleChildScrollView(
            child:
              Center(
                child: Column(
                  children: const [
                    Text(
                      'Stay at home &',
                      style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Get Support',
                      style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Image(
                      image: AssetImage(
                        'assets/icons/home_1.png'
                      ),
                    ),
                  ],
                ),
              ),
          ) ,
      ),
    );
  }
}

