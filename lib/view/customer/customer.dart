import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/bloc/cubic.dart';
import 'package:foodapp/bloc/states.dart';
import 'package:foodapp/shared/components/components.dart';
import 'package:foodapp/shared/resources/color_manager.dart';
import 'package:foodapp/shared/resources/routes_manager.dart';

class customer_screen extends StatefulWidget {
  const customer_screen({Key? key}) : super(key: key);

  @override
  _customer_screenState createState() => _customer_screenState();
}

class _customer_screenState extends State<customer_screen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubic, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubic = AppCubic.get(context);

          return Scaffold(
            appBar: AppBar(
              leading: builditemAppbar(context),
            ),
            body: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 8.0,
                right: 8.0,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultButton(
                          icon2: true,
                          icon: true,
                          Iconbutton2: Icons.add_box,
                          colorIcon2: ColorManager.white,
                          height: 40,
                          sizeicon2: 25,
                          Iconbutton: Icons.done,
                          Textcolor: ColorManager.white,
                          colorIcon: ColorManager.primary,
                          width: 250,
                          shape: false,
                          background: ColorManager.primary,
                          function: () {
                            cubic.getCategories(0);
                            print(cubic.categories);
                            if(cubic.categories!=null)Navigator.pushReplacementNamed(
                                context, Routes.editcustomer_screen);
                          },
                          text: 'Add New Customer',
                          isUpperCase: false),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Customer',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w900),
                        ),
                      ),
                      ConditionalBuilder(
                          condition: cubic.modeledite != null ,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: SizedBox(
                                height: 183 * 11,
                                width: double.infinity,
                                child: ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return builditemwallexpense(
                                        context,
                                        true,
                                        Routes.editcustomer_screen,cubic.modeledite!
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        myDivider(),
                                    itemCount: 10),
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
