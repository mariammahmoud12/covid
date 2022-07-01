import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid19/models/scan_model.dart';
import 'package:covid19/shared/cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/user_model.dart';
import '../../modules/home_screen/home_screen.dart';
import '../../modules/messenger_screen/chats_screen.dart';
import '../../modules/setting_screen/setting_screen.dart';
import '../../modules/user_profile_screen/user_profile_screen.dart';
import '../components/constants.dart';
import 'package:http/http.dart' as http;

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

  Future<bool> getUserData() async {
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

    return userModel != null;
  }

  List<UserModel>? chats;

  void getChats() {
    emit(AppGetChatsLoadingState());

    FirebaseFirestore.instance.collection('users').get().then((value) async {
      chats = [];
      for (var element in value.docs) {
        if (element.data()['uId'] != userModel!.uId) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userModel!.uId)
              .collection('chats')
              .doc(element.data()['uId'])
              .collection('messages')
              .get()
              .then((value) {
            if (value.docs.isNotEmpty) {
              chats!.add(UserModel.fromJson(element.data()));
            }
          });
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

  File? profileImage;

  var picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path.toString());
      emit(PickImageSuccessState());
    } else {
      emit(PickImageErrorState());
    }
  }

  ScanModel? scanResult;

  Future<void> getScanResult() async {
    const String url = 'https://27ea-45-242-158-16.eu.ngrok.io/api/upload/xray';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('picture', profileImage!.path.toString()));
    var requestStream = await request.send();
    var response1 = await http.Response.fromStream(requestStream);

    scanResult = ScanModel.fromJson(json.decode(response1.body));
  }
}
