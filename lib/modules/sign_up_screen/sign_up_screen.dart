import 'package:covid19/models/doctor_model.dart';
import 'package:covid19/models/user_model.dart';
import 'package:covid19/modules/login_screen/cubit/login_cubit.dart';
import 'package:covid19/modules/login_screen/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:covid19/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../verify_doctor/verify_doctor.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  var password1Controller = TextEditingController();
  var emailController = TextEditingController();
  var typeController = TextEditingController();

  String type = '';

  bool ismale = true;

  var formKey = GlobalKey<FormState>();

  // String dropdownvalue = 'Item 1';
  //
  // // List of items in our dropdown menu
  // var items = [
  //   'Item 1',
  //   'Item 2',
  //   'Item 3',
  //   'Item 4',
  //   'Item 5',
  // ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 1.0,
              title: Text(
                'SIGN UP',
                style: TextStyle(
                  color: DarkBlueColor,
                  fontSize: 27.0,
                ),
              ),
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
            body: Stack(alignment: AlignmentDirectional.topStart, children: [
              const Image(
                image: AssetImage(
                  'assets/icons/Component1.png',
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
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
                              }),
                          const SizedBox(
                            height: 20.0,
                          ),
                          DefaultFormFeild(
                              controller: userController,
                              type: TextInputType.text,
                              label: 'Username',
                              prefix: Icons.person,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'username must not be empty';
                                }
                                return null;
                              }),
                          const SizedBox(
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
                              }),
                          const SizedBox(
                            height: 20.0,
                          ),
                          DefaultFormFeild(
                              controller: password1Controller,
                              type: TextInputType.visiblePassword,
                              label: 'Repeat Password',
                              prefix: Icons.lock,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Password must not be empty';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 20.0,
                          ),
                          DefaultFormFeild(
                              controller: typeController,
                              type: TextInputType.text,
                              label: 'Register as',
                              prefix: Icons.directions_run_outlined,
                              validate: (String? value) {
                                type = value!;
                                if (value.isEmpty) {
                                  return 'Type must be Doctor / User';
                                }
                                return null;
                              }),
                          // DropdownButton(
                          //
                          //   // Initial Value
                          //   value: dropdownvalue,
                          //
                          //   // Down Arrow Icon
                          //   icon: const Icon(Icons.keyboard_arrow_down),
                          //
                          //   // Array list of items
                          //   items: items.map((String items) {
                          //     return DropdownMenuItem(
                          //       value: items,
                          //       child: Text(items),
                          //     );
                          //   }).toList(),
                          //   // After selecting the desired option,it will
                          //   // change button value to selected value
                          //   onChanged: (String? newValue) {
                          //     setState(() {
                          //       dropdownvalue = newValue!;
                          //     });
                          //   },
                          // ),
                          // DropdownButton<String>(
                          //   value: dropdownValue,
                          //   icon: const Icon(
                          //       Icons.keyboard_arrow_down_outlined
                          //   ),
                          //   elevation: 16,
                          //   style: TextStyle(
                          //       color: DarkBlueColor
                          //   ),
                          //   underline: Container(
                          //     height: 1,
                          //     color: TealColor,
                          //   ),
                          //   onChanged: (String? newValue) {
                          //     setState(() {
                          //       dropdownValue = newValue!;
                          //     });
                          //   },
                          //   items: <String>['Doctor', 'User']
                          //       .map<DropdownMenuItem<String>>((String value) {
                          //     return DropdownMenuItem<String>(
                          //       value: value,
                          //       child: Text(value),
                          //     );
                          //   }).toList(),
                          // ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          ismale = true;
                                        });
                                      },
                                      icon: ismale ? const Icon(Icons.check_circle) : const Icon(Icons.check_circle_outline),
                                      color: TealColor,
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      'Male',
                                      style: TextStyle(color: Colors.grey[600], fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          ismale = false;
                                        });
                                      },
                                      icon: ismale ? const Icon(Icons.check_circle_outline) : const Icon(Icons.check_circle),
                                      color: TealColor,
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      'Female',
                                      style: TextStyle(color: Colors.grey[600], fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            height: 50.0,
                            width: double.infinity,
                            decoration: BoxDecoration(color: TealColor, borderRadius: BorderRadius.circular(6.0)),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: MaterialButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  if (type.toString() == 'doctor') {
                                    DoctorModel model = DoctorModel(
                                      name: userController.text,
                                      email: emailController.text,
                                      gander: ismale ? 'male' : 'female',
                                    );

                                    await LoginCubit.get(context).registerDoctor(model, passwordController.text, context);
                                    // navigator(context, VerifyDoctor(model: model));
                                  } else {
                                    UserModel model = UserModel(
                                      name: userController.text,
                                      email: emailController.text,
                                      gander: ismale ? 'male' : 'female',
                                    );

                                    await LoginCubit.get(context).registerPatient(model, passwordController.text, context);
                                  }
                                }
                              },
                              child: const Text(
                                'SIGN UP',
                                style: TextStyle(color: Colors.white, fontSize: 20.0),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              height: 75.0,
                              alignment: AlignmentDirectional.bottomCenter,
                              child: const Image(
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
            ]),
          );
        },
      ),
    );
  }
}
