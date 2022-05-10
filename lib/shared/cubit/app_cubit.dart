import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid19/shared/cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model.dart';
import '../../modules/home_screen/home_screen.dart';
import '../../modules/messenger_screen/chats_screen.dart';
import '../../modules/setting_screen/setting_screen.dart';
import '../../modules/user_profile_screen/user_profile_screen.dart';
import '../components/constants.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const ChatsScreen(),
    const UserProfileScreen(),
    const SettingScreen(),
  ];

  List<String> titles = [
    'Home',
    'Messages',
    'Profile',
    'Settings',
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());

    if (index == 1) {
      getChats();
    }
  }

  Future<void> getUserData() async {
    if (uId != null) {
      emit(AppGetUserLoadingState());

      await FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
        print(value.data());
        userModel = UserModel.fromJson(value.data()!);
        emit(AppGetUserSuccessState());
      }).catchError((error) {
        emit(AppGetUserErrorState());
      });
    } else {
      print('nullll');
    }
  }

  List<UserModel>? chats;

  void getChats() {
    emit(AppGetChatsLoadingState());

    FirebaseFirestore.instance.collection('users').get().then((value) {
      chats = [];
      for (var element in value.docs) {
        if (element.data()['uId'] != userModel!.uId) {
          chats!.add(UserModel.fromJson(element.data()));
        }
      }

      print('chats!.length');
      print(chats!.length);
      emit(AppGetChatsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetChatsErrorState());
    });
  }
}
