import 'package:flutter/material.dart';
import 'package:foodapp/shared/components/components.dart';
import 'package:foodapp/shared/resources/color_manager.dart';
import 'package:foodapp/shared/resources/routes_manager.dart';
class addInformation_Screen extends StatefulWidget {
  const addInformation_Screen({Key? key}) : super(key: key);

  @override
  _addInformation_ScreenState createState() => _addInformation_ScreenState();
}

class _addInformation_ScreenState extends State<addInformation_Screen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController servicetypeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController GenderController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return   Scaffold(backgroundColor:  ColorManager.whiteOpactity,
      body: Center(
        child: SingleChildScrollView(physics: NeverScrollableScrollPhysics(),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10,bottom: 10),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    SizedBox(height: 10,),
                    Text(
                      'Information',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                        controller: servicetypeController,
                        type: TextInputType.name,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'please enter service type';
                          }
                        },
                        label:  'service type',
                        prefix: Icons.design_services),
                    SizedBox(
                      height: 15,
                    ),
                    defaultFormField(
                        controller: nameController,
                        type: TextInputType.emailAddress,
                        validate: (value){
                          if(value==null ){
                            return 'please enter Your Name';
                          }
                        },

                        label: 'Your Name ',
                        prefix: Icons.person),
                    SizedBox(
                      height: 15,
                    ),
                    defaultFormField(
                        controller: locationController,
                        type: TextInputType.emailAddress,
                        validate: (value){
                          if(value==null ){
                            return 'please Location';
                          }
                        },

                        label: 'Location ',
                        prefix: Icons.location_on),

                    SizedBox(
                      height: 15,
                    ),
                    defaultFormField(


                        controller: GenderController,

                        type: TextInputType.text,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Gender ';
                          }
                        },
                        label: 'Gender',
                        prefix: Icons.family_restroom_outlined),
                    SizedBox(
                      height: 15,
                    ),
                    defaultFormField(


                        controller: timeController,

                        type: TextInputType.phone,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'service time ';
                          }
                        },
                        label: 'service time',
                        prefix: Icons.timer),
                    SizedBox(
                      height: 20,
                    ),
                    defaultButton(Textcolor:ColorManager.primary,
                        icon2: true,icon: true,Iconbutton2: Icons.add_box,colorIcon2: ColorManager.primary,
                        height: 40,sizeicon2: 25,
                        Iconbutton: Icons.done,colorIcon: ColorManager.white,
                        width: 200,
                        shape: false,
                        background: Colors.white,
                        function: () {

                        },
                        text: 'Add Photo ',
                        isUpperCase: false),
                  SizedBox(height: 20,),


                    defaultButton(Textcolor:ColorManager.primary,
                        icon2: true,icon: true,Iconbutton2: Icons.qr_code_outlined,colorIcon2: ColorManager.primary,
                        height: 40,sizeicon2: 25,
                        Iconbutton: Icons.done,colorIcon: ColorManager.white,
                        width: 200,
                        shape: false,
                        background: Colors.white,
                        function: () {

                        },
                        text: 'Add Barcode ',
                        isUpperCase: false),
                    SizedBox(
                      height:40,
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
                              background: ColorManager.primaryshade100),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        defaultButton(
                          function: () {

                          },
                          text: 'Add Information',
                          shape: false,
                          width: 130,Iconbutton: Icons.edit,colorIcon: ColorManager.white,
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
  }
}
