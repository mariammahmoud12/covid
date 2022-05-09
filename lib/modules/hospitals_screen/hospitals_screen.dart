import 'dart:ui';

import 'package:covid19/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../hospital_info_screen/hospital_info_screen.dart';

class HospitalsScreen extends StatelessWidget {
  const HospitalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: Text(
          'Hospitals',
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
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/icons/girl.jpg'),
            radius: 22.0,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey[100],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search , color: DarkBlueColor),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: DarkBlueColor
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage('assets/icons/Hospital.png'),
                                width: double.infinity,
                              ),
                              Text(
                                'Hospitals',
                                style: TextStyle(
                                    color: DarkBlueColor,
                                    fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'Cairo, Egypt',
                                style: TextStyle(
                                  color: LightGreyColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(bottom: 10.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color:  Color(0x1f59d0d0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        onTap: (){
                          navigator(context, HospitalInfoScreen());
                        },
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    Expanded(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage('assets/icons/Hospital.png'),
                                width: double.infinity,
                              ),
                              Text(
                                'Hospitals',
                                style: TextStyle(
                                    color: DarkBlueColor,
                                    fontSize: 30.0
                                ),
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'Cairo, Egypt',
                                style: TextStyle(
                                  color: LightGreyColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(bottom: 10.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color:  Color(0x1f59d0d0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        onTap: (){
                          navigator(context, HospitalInfoScreen());
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage('assets/icons/Hospital.png'),
                                width: double.infinity,
                              ),
                              Text(
                                'Hospitals',
                                style: TextStyle(
                                    color: DarkBlueColor,
                                    fontSize: 30.0
                                ),
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'Cairo, Egypt',
                                style: TextStyle(
                                  color: LightGreyColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(bottom: 10.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color:  Color(0x1f59d0d0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        onTap: (){
                          navigator(context, HospitalInfoScreen());
                        },
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    Expanded(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage('assets/icons/Hospital.png'),
                                width: double.infinity,
                              ),
                              Text(
                                'Hospitals',
                                style: TextStyle(
                                    color: DarkBlueColor,
                                    fontSize: 30.0
                                ),
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'Cairo, Egypt',
                                style: TextStyle(
                                  color: LightGreyColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(bottom: 10.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color:  Color(0x1f59d0d0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        onTap: (){
                          navigator(context, HospitalInfoScreen());
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage('assets/icons/Hospital.png'),
                                width: double.infinity,
                              ),
                              Text(
                                'Hospitals',
                                style: TextStyle(
                                    color: DarkBlueColor,
                                    fontSize: 30.0
                                ),
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'Cairo, Egypt',
                                style: TextStyle(
                                  color: LightGreyColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(bottom: 10.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color:  Color(0x1f59d0d0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        onTap: (){
                          navigator(context, HospitalInfoScreen());
                        },
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    Expanded(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage('assets/icons/Hospital.png'),
                                width: double.infinity,
                              ),
                              Text(
                                'Hospitals',
                                style: TextStyle(
                                    color: DarkBlueColor,
                                    fontSize: 30.0
                                ),
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'Cairo, Egypt',
                                style: TextStyle(
                                  color: LightGreyColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(bottom: 10.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color:  Color(0x1f59d0d0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        onTap: (){
                          navigator(context, HospitalInfoScreen());
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage('assets/icons/Hospital.png'),
                                width: double.infinity,
                              ),
                              Text(
                                'Hospitals',
                                style: TextStyle(
                                    color: DarkBlueColor,
                                    fontSize: 30.0
                                ),
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'Cairo, Egypt',
                                style: TextStyle(
                                  color: LightGreyColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(bottom: 10.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color:  Color(0x1f59d0d0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        onTap: (){
                          navigator(context, HospitalInfoScreen());
                        },
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    Expanded(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage('assets/icons/Hospital.png'),
                                width: double.infinity,
                              ),
                              Text(
                                'Hospitals',
                                style: TextStyle(
                                    color: DarkBlueColor,
                                    fontSize: 30.0
                                ),
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'Cairo, Egypt',
                                style: TextStyle(
                                  color: LightGreyColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(bottom: 10.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color:  Color(0x1f59d0d0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        onTap: (){
                          navigator(context, HospitalInfoScreen());
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage('assets/icons/Hospital.png'),
                                width: double.infinity,
                              ),
                              Text(
                                'Hospitals',
                                style: TextStyle(
                                    color: DarkBlueColor,
                                    fontSize: 30.0
                                ),
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'Cairo, Egypt',
                                style: TextStyle(
                                  color: LightGreyColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(bottom: 10.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color:  Color(0x1f59d0d0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        onTap: (){
                          navigator(context,HospitalInfoScreen());
                        },
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    Expanded(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage('assets/icons/Hospital.png'),
                                width: double.infinity,
                              ),
                              Text(
                                'Hospitals',
                                style: TextStyle(
                                    color: DarkBlueColor,
                                    fontSize: 30.0
                                ),
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'Cairo, Egypt',
                                style: TextStyle(
                                  color: LightGreyColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(bottom: 10.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color:  Color(0x1f59d0d0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        onTap: (){
                          navigator(context, HospitalInfoScreen());
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
