import 'package:covid19/shared/components/components.dart';
import 'package:covid19/shared/cubit/app_cubit.dart';
import 'package:covid19/shared/cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppStates>(
      builder: (context, state) => Scaffold(
        appBar:  AppBar(
          backgroundColor: Colors.white,
          elevation: 1.0,
          title: Text(
            AppCubit.get(context).titles[AppCubit.get(context).currentIndex],
            style: TextStyle(
              color: DarkBlueColor,
              fontSize: 27.0,
            ),
          ),
          centerTitle: true,
          actions: const [
             CircleAvatar(
              backgroundImage: AssetImage('assets/icons/girl.jpg'),
              radius: 22.0,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: AppCubit.get(context).screens[AppCubit.get(context).currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: AppCubit.get(context).currentIndex,
          onTap: (index) {
            AppCubit.get(context).changeBottomNav(index);
          },
          items: [
            BottomNavigationBarItem(
              icon:Icon(
                Icons.home,
                color: AppCubit.get(context).currentIndex == 0 ? DarkBlueColor : LightGreyColor,
                size: 40.0,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon:Icon(
                Icons.message_outlined,
                color: AppCubit.get(context).currentIndex == 1 ? DarkBlueColor : LightGreyColor,
                size: 40.0,
              ),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon:Icon(
                Icons.person,
                color: AppCubit.get(context).currentIndex == 2 ? DarkBlueColor : LightGreyColor,
                size: 40.0,
              ),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon:Icon(
                Icons.settings,
                color: AppCubit.get(context).currentIndex == 3 ? DarkBlueColor : LightGreyColor,
                size: 40.0,
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
