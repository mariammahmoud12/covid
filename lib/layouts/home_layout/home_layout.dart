import 'package:covid19/modules/home_screen/home_screen.dart';
import 'package:covid19/modules/messenger_screen/messenger_screen.dart';
import 'package:covid19/modules/setting_screen/setting_screen.dart';
import 'package:covid19/modules/user_profile_screen/user_profile_screen.dart';
import 'package:covid19/shared/components/components.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
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
        actions: const [
           CircleAvatar(
            backgroundImage: AssetImage('assets/icons/girl.jpg'),
            radius: 22.0,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: screens[currentIndex],
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
              Icons.message_outlined,
              color:currentIndex == 1 ?DarkBlueColor : LightGreyColor,
              size: 40.0,
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon:Icon(
              Icons.person,
              color:currentIndex == 2 ?DarkBlueColor : LightGreyColor,
              size: 40.0,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon:Icon(
              Icons.settings,
              color:currentIndex == 3 ?DarkBlueColor : LightGreyColor,
              size: 40.0,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
