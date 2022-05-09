import 'package:covid19/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../../layouts/home_layout/home_layout.dart';
import '../login_screen/login_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
   ForgetPasswordScreen({Key? key}) : super(key: key);
  var phoneController = TextEditingController();

  var FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        // title: Text(
        //   'About Doctor',
        //   style: TextStyle(
        //     color: DarkBlueColor,
        //     fontSize: 27.0,
        //   ),
        // ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: DarkBlueColor,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: FormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Forget Password',
                    style: TextStyle(
                        fontSize: 30.0,
                        color: DarkBlueColor,
                       // fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 40.0,),
                  Text(
                    'it is a long established fact that a reader will be distracted the readable content.',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: LightGreyColor,
                    ),
                  ),
                  SizedBox(height: 40.0,),
                  DefaultFormFeild(
                      controller: phoneController,
                      type: TextInputType.phone,
                      label: 'Phone number',
                      prefix: Icons.phone_android_outlined,
                      validate: (String ? value)
                      {
                        if (value!.isEmpty) {
                          return 'Email Address must not be empty';
                        }
                        return null;
                      }
                  ),
                  SizedBox(height: 40.0,),
                  Container(
                    height: 50.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: TealColor,
                        borderRadius: BorderRadius.circular(6.0)
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: MaterialButton(
                      onPressed: ()
                      {
                        if(FormKey.currentState!.validate())
                        {
                          navigator(context, LoginScreen());
                        }
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0,),
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
    );
  }
}
