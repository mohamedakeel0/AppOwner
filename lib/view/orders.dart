import 'package:flutter/material.dart';
import 'package:foodapp/shared/components/components.dart';
import 'package:foodapp/shared/resources/color_manager.dart';
import 'package:foodapp/shared/resources/routes_manager.dart';
class order_screen extends StatefulWidget {
  const order_screen({Key? key}) : super(key: key);

  @override
  _order_screenState createState() => _order_screenState();
}

class _order_screenState extends State<order_screen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var SearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: builditemAppbar(context),title: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(50),
        ),
        child: defaultButton(
            icon2: true,icon: true,Iconbutton2: Icons.search,colorIcon2: ColorManager.primary,
            height: 40,sizeicon2: 25,
            Iconbutton: Icons.search,colorIcon: ColorManager.white,
            width: 350,
            shape: false,Textcolor: ColorManager.primary,
            background: Colors.white,
            function: () {

            },
            text: 'Search Order',
            isUpperCase: false),
      ),),
      body: SingleChildScrollView(child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(height:200*12,
            child: ListView.separated(physics:const NeverScrollableScrollPhysics(),itemBuilder: (context, index) {
              return  builditemOrder(context);
            }, separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: myDivider(),
            ) , itemCount: 11),
          ),
        ),
      ],),),
    );
  }
}
