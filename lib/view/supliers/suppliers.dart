import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/bloc/cubic.dart';
import 'package:foodapp/bloc/states.dart';
import 'package:foodapp/shared/components/components.dart';
import 'package:foodapp/shared/resources/color_manager.dart';
import 'package:foodapp/shared/resources/routes_manager.dart';
class supplier_screen extends StatefulWidget {
  const supplier_screen({Key? key}) : super(key: key);

  @override
  _supplier_screenState createState() => _supplier_screenState();
}

class _supplier_screenState extends State<supplier_screen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubic, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {

          var cubic = AppCubic.get(context);

          return  Scaffold(appBar: AppBar(leading:builditemAppbar(context),),
            body: Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8.0,),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      SizedBox(height: 10,),
                      defaultButton(
                          icon2: true,icon: true,Iconbutton2: Icons.add_box,
                          height: 40,sizeicon2: 25,
                          Iconbutton: Icons.done,colorIcon: ColorManager.primary,
                          width: 250,
                          shape: false,
                          background: Colors.orangeAccent,
                          function: () {
                            Navigator.pushReplacementNamed(context, Routes.editsupplier_screen);
                          },
                          text: 'Add New Supplier',
                          isUpperCase: false),
                      SizedBox(height: 5,),
                      Text(
                        'Supplier',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                      ),

                      ConditionalBuilder(
                          condition: cubic.modeledite != null ,
                          builder: (context) {
                           return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: SizedBox(height:183*11,width:double.infinity,
                                child:   ListView.separated(physics: NeverScrollableScrollPhysics(),itemBuilder: (context, index) {

                                  return builditemwallexpense(context,true,Routes.editsupplier_screen,cubic.modeledite!);

                                }, separatorBuilder: (context, index) => myDivider() , itemCount: 10),
                              ),
                            );
                          },
                          fallback: (context) => Center(
                            child: CircularProgressIndicator(),
                          )),

                    ],
                  ),
                ),
              ),
            ),
          );

        });

  }
}
