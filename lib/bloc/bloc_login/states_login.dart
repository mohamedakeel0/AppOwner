import 'package:foodapp/model/login_model.dart';

abstract class LoginStates{}
class InitailLoginStatesStates extends LoginStates{}
class AppLoginLoadingState extends LoginStates{}
class AppLoginSuccessState extends  LoginStates{
  final LoginModel loginModel;

  AppLoginSuccessState(this.loginModel);
}

class AppLoginErrorState extends LoginStates{
  final String error;
  AppLoginErrorState(this.error);
}
class AppChangePasswordVisibilityState extends  LoginStates{}