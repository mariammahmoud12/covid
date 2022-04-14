import 'package:covid19/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../messenger_screen/messenger_screen.dart';
import '../setting_screen/setting_screen.dart';
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
    HomeScreen(),
    SettingScreen(),
    MessengerScreen(),
    UserProfileScreen()
  ];

  List<String> titles =
  [
    'Home',
    'Settings',
    'Messages',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: Text(
          '${titles[currentIndex]}',
          style: TextStyle(
            color: DarkBlueColor,
            fontSize: 27.0,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: ()
          {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios , color: DarkBlueColor,),
        ),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/icons/girl.jpg'),
            radius: 22.0,
            ),
        ],
      ),
      backgroundColor: Colors.white,
      body: currentIndex == 0 ? Padding(
        padding:EdgeInsets.only(left: 20.0,top: 20.0,right: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Image(
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
                      padding: EdgeInsets.only(bottom: 10.0),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color:  Color(0x1f59d0d0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0,),
                  Expanded(
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
                        ],
                      ),
                      padding: EdgeInsets.only(bottom: 10.0),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color:  Color(0x1f59d0d0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Image(
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
                      padding: EdgeInsets.only(bottom: 10.0),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color:  Color(0x1f59d0d0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0,),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Image(
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
                      padding: EdgeInsets.only(bottom: 10.0),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color:  Color(0x1f59d0d0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Image(
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
                      padding: EdgeInsets.only(bottom: 10.0),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color:  Color(0x1f59d0d0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0,),
                  Expanded(
                    child: Container(
                      // child: Column(
                      //   children: [
                      //     // Image(
                      //     //   image: AssetImage('assets/icons/Hospital.png'),
                      //     //   width: double.infinity,
                      //     // ),
                      //     Text(
                      //       'Hospitals',
                      //       style: TextStyle(
                      //           color: DarkBlueColor,
                      //           fontSize: 30.0
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      padding: EdgeInsets.only(bottom: 10.0),
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
      ) :screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon:Icon(
              Icons.home,
              color:currentIndex == 0 ?DarkBlueColor : LightGreyColor,
              size: 40.0,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon:Icon(
                Icons.settings,
              color:currentIndex == 1 ?DarkBlueColor : LightGreyColor,
              size: 40.0,
            ),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon:Icon(
                Icons.message_outlined,
              color:currentIndex == 2 ?DarkBlueColor : LightGreyColor,
              size: 40.0,
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon:Icon(
                Icons.person,
              color:currentIndex == 3 ?DarkBlueColor : LightGreyColor,
              size: 40.0,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
