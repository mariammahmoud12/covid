import 'package:covid19/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../doctors_screen/doctors_screen.dart';
import '../hospitals_screen/hospitals_screen.dart';
import '../medicine_reminder_screen/medicine_reminder_screen.dart';
import '../messenger_screen/messenger_screen.dart';
import '../scan_screen/scan_screen.dart';
import '../setting_screen/setting_screen.dart';
import '../symptoms_screen/symptoms_screen.dart';
import '../user_profile_screen/user_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex =0;

  List<Widget> screens =
  [
    const HomeScreen(),
    const MessengerScreen(),
    const UserProfileScreen(),
    const SettingScreen(),
  ];

  List<String> titles =
  [
    'Home',
    'Messages',
    'Profile',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Padding(
        padding:const EdgeInsets.only(left: 20.0,top: 20.0,right: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: InkWell(
                      child: Container(
                        child: Column(
                          children: [
                            const Image(
                              image: AssetImage('assets/icons/Doctor1.png'),
                              width: double.infinity,
                            ),
                            Text(
                              'Doctors',
                              style: TextStyle(
                                  color: DarkBlueColor,
                                  fontSize: 30.0
                              ),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.only(bottom: 10.0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: const Color(0x1f59d0d0),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      onTap: (){
                        navigator(context, const DoctorsScreen());
                      },
                    ),
                  ),
                  const SizedBox(width: 15.0,),
                  Expanded(
                    child: InkWell(
                      child: Container(
                        child: Column(
                          children: [
                            const Image(
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
                          ],
                        ),
                        padding: const EdgeInsets.only(bottom: 10.0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: const Color(0x1f59d0d0),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      onTap: (){
                        navigator(context, const HospitalsScreen());
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: InkWell(
                      child: Container(
                        child: Column(
                          children: [
                            const Image(
                              image: AssetImage('assets/icons/Symptoms.png'),
                              width: double.infinity,
                            ),
                            Text(
                              'Symptoms',
                              style: TextStyle(
                                  color: DarkBlueColor,
                                  fontSize: 30.0
                              ),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.only(bottom: 10.0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: const Color(0x1f59d0d0),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      onTap: (){
                        navigator(context, const SymptomsScreen());
                      },
                    ),
                  ),
                  const SizedBox(width: 15.0,),
                  Expanded(
                    child: InkWell(
                      child: Container(
                        child: Column(
                          children: [
                            const Image(
                              image: AssetImage('assets/icons/ScanRay.png'),
                              width: double.infinity,
                            ),
                            Text(
                              'Scan Rays',
                              style: TextStyle(
                                  color: DarkBlueColor,
                                  fontSize: 30.0
                              ),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.only(bottom: 10.0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: const Color(0x1f59d0d0),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      onTap: (){
                        navigator(context, const ScanScreen());
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0,),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Container(
                        child: Column(
                          children: [
                            const Image(
                              image: AssetImage('assets/icons/Reminder.png'),
                              width: double.infinity,
                            ),
                            Text(
                              'Medicine',
                              style: TextStyle(
                                color: DarkBlueColor,
                                fontSize: 30.0,
                              ),
                            ),
                            Text(
                              'Reminder',
                              style: TextStyle(
                                color: DarkBlueColor,
                                fontSize: 30.0,
                              ),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.only(bottom: 10.0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: const Color(0x1f59d0d0),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      onTap: (){
                        navigator(context, const MedicineReminderScreen());
                      },
                    ),
                  ),
                  const SizedBox(width: 15.0,),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
