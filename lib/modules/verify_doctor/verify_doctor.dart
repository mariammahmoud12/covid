import 'package:covid19/layouts/home_layout/home_layout.dart';
import 'package:covid19/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class VerifyDoctor extends StatelessWidget {
  const VerifyDoctor({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
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
              radius: Radius.circular(6),
              padding: const EdgeInsets.all(40),
              color: TealColor,
              dashPattern: [8 , 8],
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Container(
                  width: double.infinity,
                  child: Form(
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage('assets/icons/cloud.png'),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Drag and Drop files',
                          style: TextStyle(
                              color: DarkBlueColor,
                              fontSize: 20.0
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          height: 50.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                              color: TealColor,
                              borderRadius: BorderRadius.circular(6.0)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: MaterialButton(
                            onPressed: () {
                              //   if (FormKey.currentState!.validate()) {
                              navigator(context, HomeLayout());
                              //   }
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
                  ) ,
                ),
              ),
            ),
                const SizedBox(
                  height: 40.0,
                ),
                Padding(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
