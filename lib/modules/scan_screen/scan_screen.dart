import 'package:covid19/modules/scan_result_screen/scan_result_screen.dart';
import 'package:covid19/shared/components/components.dart';
import 'package:covid19/shared/cubit/app_cubit.dart';
import 'package:covid19/shared/cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {

  @override
  void initState() {
    AppCubit.get(context).imageScan = null;
    AppCubit.get(context).scanResult = null;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1.0,
          title: Text(
            'Scan X-Ray',
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
                  // Text(
                  //   'to verify you are a doctor upload your ID',
                  //   style: TextStyle(
                  //     color: DarkBlueColor,
                  //     fontSize: 22.0,
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 40.0,
                  // ),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(6),
                    padding: const EdgeInsets.all(40),
                    color: TealColor,
                    dashPattern: const [8, 8],
                    child: AppCubit.get(context).imageScan == null
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

                                          AppCubit.get(context).pickImage();
                                        },
                                        child: const Text(
                                          'Upload Photo',
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
                              image: FileImage(AppCubit.get(context).imageScan!),
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  GestureDetector(
                    onTap: () async{
                      await AppCubit.get(context).getScanResult();
                      // Navigator.pop(context);
                      navigator(context, const ScanScreenResult());
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
      ),
    );
  }
}
