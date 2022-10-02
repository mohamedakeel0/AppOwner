import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/bloc/bloc_login/cubic_login.dart';
import 'package:foodapp/bloc/bloc_login/states_login.dart';
import 'package:foodapp/shared/components/components.dart';
import 'package:foodapp/shared/network/remot/local/cache_helper.dart';
import 'package:foodapp/shared/resources/routes_manager.dart';
class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);

  @override
  _Login_screenState createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => LoginCubic(),
        child: BlocConsumer<LoginCubic, LoginStates>(
            listener: (context, state) {

              if (state is AppLoginSuccessState) {
                if (state.loginModel.reply!) {


                  CacheHelper.saveData(
                      key: 'owner_id', value: state.loginModel.ownerId!);
                  ShowToast(
                      text: 'Login Success', state: Toaststates.SUCCESS);
                  Navigator.pushReplacementNamed(
                      context, Routes.menu_screen);
                } else {
                  ShowToast(
                      text: 'Login Failed', state: Toaststates.ERROR);
                }
              }
            }, builder:(context, state) {

          var cubic = LoginCubic.get(context);



          return Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(300.0),
                child: Container(child: Padding(
                  padding: const EdgeInsets.only(left: 20,top: 200),
                  child: Column( crossAxisAlignment: CrossAxisAlignment.start,children: [

                    Text(
                      'Login',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      'Login now to brower our hot offers',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.grey[600]),
                    ),
                  ],),
                ),
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: new BorderRadius.vertical(
                          bottom: Radius.elliptical(150, 30)
                      )),)),
            body: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                              controller: emailController,myfocusborder:OutlineInputBorder(

                              borderSide: BorderSide(
                                color:Colors.orangeAccent,

                              )
                          ),
                              type: TextInputType.emailAddress,
                              validate: (value){
                                if(value==null ){
                                  return 'please enter your email address';
                                }
                              },
                              label: 'Email Address',
                              prefix: Icons.email_outlined),
                          SizedBox(
                            height: 15,
                          ),
                          defaultFormField(

                              myfocusborder:OutlineInputBorder(

                                  borderSide: BorderSide(
                                    color:Colors.orangeAccent,

                                  )
                              ),
                              onSubmit: (value) {
                                if (formkey.currentState!.validate()) {

                                }
                              },
                              controller: passwordController,
                              isPassword: cubic.isPassword,


                              suffix: cubic.suffix,
                              suffixPressed: () {
                                cubic.changePasswordvisibility();
                              },
                              type: TextInputType.visiblePassword,
                              validate: (value) {
                                if (value!.isEmpty
                                ) {
                                  return 'Invalid password!';
                                }
                              },
                              label: 'password',
                              prefix: Icons.lock_outline),

                          SizedBox(
                            height: 30,
                          ),
                          defaultButton(shape: false,
                              function: () {
                                if (formkey.currentState!.validate()) {
                                  cubic.LoginUser(email:emailController.text ,password:passwordController.text ,);

                                }

                              },
                              text: 'Login',
                              isUpperCase: false),


                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don`t have an account?',
                                style: TextStyle(fontSize: 12),
                              ),
                              TextButton(
                                  onPressed: () {

                                  },
                                  child: Text(
                                    'Register',
                                    style: TextStyle(fontSize: 13,color: Colors.orangeAccent),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }));

  }
}
