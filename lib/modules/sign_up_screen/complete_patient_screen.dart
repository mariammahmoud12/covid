import 'package:covid19/models/user_model.dart';
import 'package:covid19/modules/login_screen/cubit/login_cubit.dart';
import 'package:covid19/modules/login_screen/cubit/login_states.dart';
import 'package:covid19/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompletePatientScreen extends StatefulWidget {
  const CompletePatientScreen({Key? key, required this.model}) : super(key: key);

  final UserModel model;

  @override
  State<CompletePatientScreen> createState() => _CompletePatientScreenState();
}

class _CompletePatientScreenState extends State<CompletePatientScreen> {
  var formKey = GlobalKey<FormState>();

  var phoneController = TextEditingController();

  Map? value1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit()..getDiseases(),
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
                              controller: phoneController,
                              type: TextInputType.phone,
                              label: 'phone number',
                              prefix: Icons.phone,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'phone number must not be empty';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20.0),
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.grey, width: 2),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<Map>(
                                isExpanded: true,
                                iconSize: 30.0,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: DarkBlueColor,
                                ),
                                value: value1,
                                items: LoginCubit.get(context).diseases.map(buildMenuItem).toList(),
                                onChanged: (value) {
                                  setState(() => value1 = value);
                                  print(value);
                                },
                              ),
                            ),
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
                                if (formKey.currentState!.validate()) {}
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

  DropdownMenuItem<Map> buildMenuItem(Map item) => DropdownMenuItem(
        value: item,
        child: Text(
          item['diseases_name'],
          style: TextStyle(fontSize: 20.0, color: Colors.grey[700]),
        ),
      );
}
