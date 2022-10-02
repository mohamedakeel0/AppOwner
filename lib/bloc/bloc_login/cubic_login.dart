

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/bloc/bloc_login/states_login.dart';
import 'package:foodapp/model/login_model.dart';
import 'dart:convert';

import 'package:foodapp/shared/network/remot/remote/dio_helper.dart';


class LoginCubic extends Cubit<LoginStates> {
  LoginCubic() : super(InitailLoginStatesStates());

  static LoginCubic get(context) => BlocProvider.of(context);
  LoginModel? loginModel;
  FormData formData = new FormData();
  void LoginUser({ required email,required password }) async{

    emit(AppLoginLoadingState());
    formData = FormData.fromMap({
      "username": "${email}",
      "password": "${password}",
    });

    await DioHelper.postdata(url: 'mapapi/owner_login.php', data: formData,).then((value) {

      loginModel = LoginModel.fromJson(jsonDecode(value.data));

      print(value.data);
      emit(AppLoginSuccessState(loginModel!));
    }).catchError((error) {
      emit(AppLoginErrorState(error.toString()));
      print(error.toString());
    });
  }
  IconData suffix= Icons.visibility_outlined;
  bool isPassword=true;
  void changePasswordvisibility(){
    isPassword=!isPassword;
    suffix= isPassword?Icons.visibility_outlined:Icons.visibility_off;
    emit( AppChangePasswordVisibilityState());
  }
}