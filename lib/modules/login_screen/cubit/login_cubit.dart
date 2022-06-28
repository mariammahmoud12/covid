import 'package:covid19/shared/components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(LoginInitialState());

  static LoginCubit get(context)=> BlocProvider.of(context);

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
}