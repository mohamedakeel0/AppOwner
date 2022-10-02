import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/bloc/cubic.dart';
import 'package:foodapp/bloc/states.dart';
import 'package:foodapp/shared/components/components.dart';
import 'package:foodapp/shared/network/remot/local/cache_helper.dart';
import 'package:foodapp/shared/resources/assets_manager.dart';
import 'package:foodapp/shared/resources/color_manager.dart';
import 'package:foodapp/shared/resources/constants_manager.dart';
import 'package:foodapp/shared/resources/routes_manager.dart';
class editsupplier_screen extends StatefulWidget {
  const editsupplier_screen({Key? key}) : super(key: key);

  @override
  _editsupplier_screenState createState() => _editsupplier_screenState();
}

class _editsupplier_screenState extends State<editsupplier_screen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController servicetypeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => AppCubic()..getCurrentLocation()..getCategories(0),
        child: BlocConsumer<AppCubic, AppStates>(
            listener: (context, state) {


            }, builder:(context, state) {

          var cubic = AppCubic.get(context);



          return Scaffold(
            backgroundColor: ColorManager.whiteOpactity,
            body: Center(
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10, top: 10, bottom: 10),
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                cubic.upimage==null?  CircleAvatar(
                                  radius: 83,

                                  child: CircleAvatar(
                                    radius: 80,
                                    backgroundImage:ResizeImage(AssetImage(ImageAssets.image),width: 120,height: 120),

                                  ),
                                ):
                                CircleAvatar(
                                  radius: 83,

                                  child: CircleAvatar(
                                    radius: 80,
                                    backgroundImage:NetworkImage('${cubic.upimage!.file}'),

                                  ),
                                ),
                                IconButton(
                                    onPressed: () {


                                      cubic.PostImage();
                                    },
                                    icon: CircleAvatar(
                                        radius: 20, child: Icon(Icons.camera_alt_outlined)))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'New Supplier',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          defaultFormField(
                              buttonIcon: true,
                              controller: locationController,
                              type: TextInputType.emailAddress,
                              validate: (value) {
                                if (value == null) {
                                  return 'please Location';
                                }
                              },
                              suffix: Icons.add_location_alt_rounded,
                              suffixPressed: () {
                                cubic.getCurrentLocation();
                                if (cubic.myLocation != null) cubic.listmarkers(
                                    cubic.myLocation!.latitude,
                                    cubic.myLocation!.latitude,
                                    false);
                                if (cubic.myLocation != null)
                                  Navigator.pushReplacementNamed(
                                      context, Routes.map_screen);
                              },
                              label: 'Location ',
                              prefix: Icons.location_on),
                          SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                              controller: nameController,
                              type: TextInputType.name,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter your name';
                                }
                              },
                              label: 'your name',
                              prefix: Icons.person),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Service Type :',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                          ),
                          SizedBox(
                            height: 5,
                          ),

                          buildItemlistCategoriesTop(context,cubic.categories!,cubic),


                          SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                              controller: dateController,
                              type: TextInputType.datetime,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Date ';
                                }
                              },
                              label: 'Date',
                              prefix: Icons.date_range_sharp),
                          SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                              controller: phoneController,
                              type: TextInputType.phone,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter phone ';
                                }
                              },
                              label: 'Phone',
                              prefix: Icons.phone),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: defaultButton(
                                    function: () {
                                      Navigator.pushReplacementNamed(
                                          context, Routes.menu_screen);
                                    },
                                    text: 'back',
                                    shape: false,
                                    width: 120,
                                    Textcolor: Colors.white,
                                    isUpperCase: true,
                                    radius: 5,
                                    background:
                                    ColorManager.primaryshade100),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              defaultButton(
                                function: () {
                                  if (formkey.currentState!.validate()) {
                                    cubic.saveEditeUser();
                                    cubic.editeUser(name:nameController.text ,type:cubic.Service,adress:locationController.text ,date:dateController.text ,phone: phoneController.text,late: cubic.lat!.toString(),long: cubic.long!.toString(),file: cubic.upimage!.file);
                                    cubic.deleteEdite();
                                  }
                                },
                                text: 'Add Customer',
                                shape: false,
                                width: 120,
                                Iconbutton: Icons.edit,
                                colorIcon: ColorManager.white,
                                Textcolor: Colors.white,
                                isUpperCase: false,
                                radius: 5,
                              ),
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
