import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/bloc/cubic.dart';
import 'package:foodapp/bloc/states.dart';
import 'package:foodapp/shared/components/components.dart';
import 'package:foodapp/shared/resources/color_manager.dart';
import 'package:foodapp/shared/resources/routes_manager.dart';

class service_screen extends StatefulWidget {
  const service_screen({Key? key}) : super(key: key);

  @override
  _service_screenState createState() => _service_screenState();
}

class _service_screenState extends State<service_screen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubic, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubic = AppCubic.get(context);

          return Scaffold(
              appBar: AppBar(
                  leading: InkWell(
                child: Icon(Icons.arrow_back),
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.menu_screen);
                },
              )),
              body: SingleChildScrollView(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                            Textcolor: ColorManager.white,
                            Iconbutton: Icons.done,
                            colorIcon: ColorManager.primary,
                            width: 250,
                            shape: false,
                            background: ColorManager.primary,
                            function: () {
                              Navigator.pushReplacementNamed(
                                  context, Routes.addNewServices_Screen);
                            },
                            text: 'Add New Servivce',
                            isUpperCase: false),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          'Pop Services',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            height: 170,
                            child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => InkWell(
                                      child: buildCategories(
                                        false,cubic.Popservices![index]
                                      ),
                                      onTap: () {
                                        cubic.getdetailsservices(cubic.Popservices![index]['id']);
                                        builditemdetailsservice(context,cubic.detailsServices!);
                                      },
                                    ),
                                separatorBuilder: (context, index) => SizedBox(
                                      width: 10,
                                    ),
                                itemCount: cubic.Popservices!.length)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'All Services',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: cubic.allservices!.length * 130,
                          child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return builditemService(context, cubic.allservices![index]);
                              },
                              separatorBuilder: (context, index) => myDivider(),
                              itemCount: cubic.allservices!.length),
                        )
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}
