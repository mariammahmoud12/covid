import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid19/models/doctor_model.dart';
import 'package:covid19/models/user_model.dart';
import 'package:covid19/modules/home_screen/home_screen.dart';
import 'package:covid19/modules/login_screen/login_screen.dart';
import 'package:covid19/modules/sign_up_screen/complete_patient_screen.dart';
import 'package:covid19/modules/verify_doctor/verify_doctor.dart';
import 'package:covid19/shared/components/components.dart';
import 'package:covid19/shared/components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_states.dart';
import 'package:http/http.dart' as http;

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<bool> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    uId == null;
    userModel = null;

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      uId = value.user!.uid;
      print(uId);
      emit(LoginSuccessState());
    }).catchError((error) {
      print('errorrrr$error');
      emit(LoginErrorState());
    });

    return uId != null;
  }

  List<Map> diseases = [];

  Future<void> getDiseases() async {
    const String url = 'https://covido-app.herokuapp.com/diseases_create/';
    http.Response request = await http.get(
      Uri.parse(url),
    );

    for (var element in (json.decode(request.body) as List)) {
      diseases.add(element);
    }
  }

  Future<void> registerPatient(UserModel model, String password, context) async {
    // const String url = 'https://covido-app.herokuapp.com/profile_create/';
    // http.Response request = await http.post(
    //   Uri.parse(url),
    //   body: {
    //     'type_name': 'patient',
    //     'name': '${model.name}',
    //     'email': '${model.email}',
    //     'password': password,
    //     'gander': '${model.gander}',
    //   },
    // );
    //
    // model = UserModel.fromJson(json.decode(request.body));
    //
    // await FirebaseAuth.instance.createUserWithEmailAndPassword(email: model.email!, password: password).then((value) async {
    //   if (value.user != null) {
    //     model.uId = value.user!.uid;
    //     model.bio = 'write your bio ...!';
    //     model.isEmailVerified = false;
    //
    //     await FirebaseFirestore.instance.collection('users').doc(model.uId).set(model.toMap()).then((value) async {
    //       await FirebaseFirestore.instance.collection('patients').doc(model.uId).set(model.toMap());
    //       navigatorAndFinish(context, LoginScreen());
    //     });
    //   }
    // });

    navigator(context, CompletePatientScreen(model: model,));
  }

  Future<void> registerDoctor(DoctorModel model, String password, context) async {
    const String url = 'https://covido-app.herokuapp.com/profile_create/';
    http.Response request = await http.post(
      Uri.parse(url),
      body: {
        'type_name': 'doctor',
        'name': '${model.name}',
        'email': '${model.email}',
        'password': password,
        'gander': '${model.gander}',
      },
    );

    model = DoctorModel.fromJson(json.decode(request.body));

    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: model.email!, password: password).then((value) async {
      if (value.user != null) {
        model.uId = value.user!.uid;
        model.bio = 'write your bio ...!';
        model.isDoctorVerified = false;

        await FirebaseFirestore.instance.collection('users').doc(model.uId).set(model.toMap()).then((value) async {
          await FirebaseFirestore.instance.collection('doctors').doc(model.uId).set(model.toMap());
          Navigator.pop(context);
          navigator(context, VerifyDoctor(model: model));
        });
      }
    });
  }
}
