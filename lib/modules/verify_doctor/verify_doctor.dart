import 'package:cloud_firestore/cloud_firestore.dart';
 import 'package:covid19/models/doctor_model.dart';
import 'package:covid19/shared/components/components.dart';
import 'package:covid19/shared/cubit/app_cubit.dart';
import 'package:covid19/shared/cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyDoctor extends StatefulWidget {
  const VerifyDoctor({Key? key, required this.model}) : super(key: key);

  final DoctorModel model;

  @override
  State<VerifyDoctor> createState() => _VerifyDoctorState();
}

class _VerifyDoctorState extends State<VerifyDoctor> {
  @override
  void initState() {
    AppCubit.get(context).imageID = null;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1.0,
            title: Text(
              'Upload ID',
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
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'to verify you are a doctor upload your ID',
                      style: TextStyle(
                        color: DarkBlueColor,
                        fontSize: 22.0,
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(6),
                      padding: const EdgeInsets.all(40),
                      color: TealColor,
                      dashPattern: const [8, 8],
                      child: AppCubit.get(context).imageID == null
                          ? ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                              child: SizedBox(
                                width: double.infinity,
                                child: Form(
                                  child: Column(
                                    children: [
                                      const Image(
                                        image: AssetImage('assets/icons/cloud.png'),
                                      ),
                                      const SizedBox(
                                        height: 60.0,
                                      ),
                                      Container(
                                        height: 50.0,
                                        width: 200.0,
                                        decoration: BoxDecoration(color: TealColor, borderRadius: BorderRadius.circular(6.0)),
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        child: MaterialButton(
                                          onPressed: () {
                                            // if (FormKey.currentState!.validate()) {
                                            //   navigator(context, ScanScreenResult());
                                            // }

                                            AppCubit.get(context).pickImage(isScan: false);
                                          },
                                          child: const Text(
                                            'Upload ID',
                                            style: TextStyle(color: Colors.white, fontSize: 20.0),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 150.0,
                              width: 200,
                              child: Image(
                                width: 75,
                                height: 75,
                                image: FileImage(AppCubit.get(context).imageID!),
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    GestureDetector(
                      onTap: () async {
                        String? imageIDUrl = await AppCubit.get(context).uploadImageID();
                        widget.model.imageID = imageIDUrl;
                        await FirebaseFirestore.instance.collection('users').doc(widget.model.uId).set(widget.model.toMap()).then((value) async {
                          await FirebaseFirestore.instance.collection('doctors').doc(widget.model.uId).set(widget.model.toMap());
                          Navigator.pop(context);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
