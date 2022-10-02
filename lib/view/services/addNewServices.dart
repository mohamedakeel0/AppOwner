import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/bloc/cubic.dart';
import 'package:foodapp/bloc/states.dart';
import 'package:foodapp/shared/components/components.dart';
import 'package:foodapp/shared/resources/routes_manager.dart';
class addNewServices_Screen extends StatefulWidget {
  const addNewServices_Screen({Key? key}) : super(key: key);

  @override
  _addNewServices_ScreenState createState() => _addNewServices_ScreenState();
}

class _addNewServices_ScreenState extends State<addNewServices_Screen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubic, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {

          var cubic = AppCubic.get(context);
          cubic.getCurrentLocation();
          return Scaffold(

            body: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          child: GridView.count(
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 1,
                            childAspectRatio: 1,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            children:
                            List.generate(cubic.Popservices!.length, (index) =>   buildCategories(
                                true,cubic.Popservices![index]
                            ),),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Center(
                          child: defaultButton(shape: false,width: 200,
                              function: () {

                                Navigator.pushReplacementNamed(
                                    context, Routes.service_screen);
                              },
                              text: 'Add service',
                              isUpperCase: false),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );

        });

  }
}
