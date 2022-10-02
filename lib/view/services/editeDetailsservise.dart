import 'package:flutter/material.dart';
import 'package:foodapp/shared/components/components.dart';
import 'package:foodapp/shared/resources/assets_manager.dart';
import 'package:foodapp/shared/resources/color_manager.dart';
import 'package:foodapp/shared/resources/routes_manager.dart';
class editedetailsServise_screen extends StatefulWidget {
  const editedetailsServise_screen({Key? key}) : super(key: key);

  @override
  _editedetailsServise_screenState createState() => _editedetailsServise_screenState();
}

class _editedetailsServise_screenState extends State<editedetailsServise_screen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController descripesController = TextEditingController();
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
                    Container(
                      height: 180,
                      child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            Align(
                              child: Stack(
                                  alignment: AlignmentDirectional.topEnd,
                                  children: [
                                    Container(
                                      height: 140,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4),
                                              topRight: Radius.circular(4)),
                                          image: DecorationImage(
                                            image: AssetImage(ImageAssets.image),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    IconButton(
                                        onPressed: () {

                                        },
                                        icon: CircleAvatar(
                                            radius: 20,
                                            child: Icon(Icons.camera_alt_outlined)))
                                  ]),
                              alignment: AlignmentDirectional.topCenter,
                            ),
                            Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                CircleAvatar(
                                  radius: 53,
                                  backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage:  AssetImage(ImageAssets.image),

                                  ),
                                ),
                                IconButton(
                                    onPressed: () {

                                    },
                                    icon: CircleAvatar(
                                        radius: 20, child: Icon(Icons.camera_alt_outlined)))
                              ],
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                      Row(children: [

                          Expanded(child: Column(children: [

                              defaultButton(Textcolor:ColorManager.primary,
                              icon2: true,icon: true,Iconbutton2: Icons.camera_alt_outlined,colorIcon2: ColorManager.primary,
                              height: 40,sizeicon2: 25,
                              Iconbutton: Icons.done,colorIcon: ColorManager.white,
                              width: 200,
                              shape: false,
                              background: Colors.white,
                              function: () {

                              },
                              text: 'upload profile ',
                              isUpperCase: false), LinearProgressIndicator(),])),
                        SizedBox(
                          width: 5,
                        ),


                          Expanded(child: Column(children: [
                            defaultButton(Textcolor:ColorManager.primary,
                                icon2: true,icon: true,Iconbutton2: Icons.camera_alt_outlined,colorIcon2: ColorManager.primary,
                                height: 40,sizeicon2: 25,
                                Iconbutton: Icons.done,colorIcon: ColorManager.white,
                                width: 200,
                                shape: false,
                                background: Colors.white,
                                function: () {

                                },
                                text: 'upload cover ',
                                isUpperCase: false),
                            LinearProgressIndicator(),])),
                      ],),

                    SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                        controller: descripesController,
                        type: TextInputType.name,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'please enter descripes';
                          }
                        },
                        label:  'descripes',
                        prefix: Icons.description_outlined),
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

                        label: ' Name ',
                        prefix: Icons.person),

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
                              background: ColorManager.primaryshade100),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        defaultButton(
                          function: () {

                          },
                          text: 'update',
                          shape: false,
                          width: 120,Iconbutton: Icons.edit,colorIcon: ColorManager.white,
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
