
import 'dart:ui';

import 'package:covid19/shared/components/components.dart';
import 'package:flutter/material.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: blueColor,
          elevation: 0.0,
          title: const Text(
            'Covid',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
          leading: const Padding(
            padding: EdgeInsets.only(
              left: 6.0,
            ),
            child: Image(
              image: AssetImage('assets/icons/logo.png'),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                //  Navigator.push(context, MaterialPageRoute(builder: (context)=> CareersScreen()));
              },
              icon: const Icon(
                Icons.menu,
                size: 30.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: blueColor,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Container(
                    child: Image(
                      image: AssetImage(
                        'assets/icons/scan.png',
                      ),
                    ),
                    width: double.infinity,
                    height: 250.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'SCAN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                          //  padding: EdgeInsets.all(10.0),
                            width: double.infinity,
                            height: 370.0,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: indigoColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              width: double.infinity,
                              height: 360.0,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: blueColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                       // height: 50.0,
                       // width: double.infinity,
                        decoration: BoxDecoration(
                            color: indigoColor,
                            borderRadius: BorderRadius.circular(35.0)
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: MaterialButton(
                          onPressed: (){ },
                          child: Text(
                            'Upload image',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 50.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: indigoColor,
                            borderRadius: BorderRadius.circular(35.0)
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: MaterialButton(
                          onPressed: (){ },
                          child: Text(
                            'SCAN',
                            style: TextStyle(
                                color: goldColor,
                                fontSize: 20.0
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                ]))));
  }
}
