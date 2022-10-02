import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/shared/components/components.dart';
import 'package:foodapp/shared/resources/assets_manager.dart';
import 'package:foodapp/shared/resources/color_manager.dart';
import 'package:foodapp/shared/resources/routes_manager.dart';

class profile_screen extends StatefulWidget {
  const profile_screen({Key? key}) : super(key: key);

  @override
  _profile_screenState createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: InkWell(child: Icon(Icons.arrow_back),onTap: (){
        Navigator.pushReplacementNamed(
            context, Routes.menu_screen);
      },),
        title: SizedBox(
          width: 100,
          child: Text('Account',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: ColorManager.black)),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.mail)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
    Row(children: [
      SizedBox(
          height: 120,
          width: 120,
          child: CircleAvatar(
            backgroundImage: AssetImage(ImageAssets.image),
            radius: 60,
          )),
      Padding(
        padding: const EdgeInsets.only(left: 15.0,bottom: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          Text(
            'Robert Steven',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: ColorManager.black),
          ),
SizedBox(height: 5,),
          Row(children: [
            Text(
              'Account Information',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: ColorManager.black),
            ),
           SizedBox(width: 18,),
            InkWell(child: Icon(Icons.arrow_forward_ios,size: 15,),onTap: (){},),


          ],)
        ],),
      )

    ],),
           SizedBox(height: 20,),
            SizedBox(height:500,
              child: ListView.separated(physics: NeverScrollableScrollPhysics(),itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20.0),
                  child: Row(children: [
                    Text(
                      name[index],
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: ColorManager.black),
                    ),
                    Spacer(),
                    InkWell(child: Icon(Icons.arrow_forward_ios,size: 17,),onTap: (){},),


                  ],),
                );
              }, separatorBuilder: (context, index) =>  myDivider(), itemCount: name.length),
            ),
            myDivider(),
            SizedBox(width:120 ,
              child: TextButton(onPressed: (){

              },child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [
                Icon(Icons.settings_power_outlined),
                SizedBox(width: 5,),
                Text('Sign Out')
              ],)),
            )
          ],
        ),
      ),
    );
  }
}
List name=[
  'Set Address for Delivery',
  'Order  List',
  'Payment  Method',
  'Last Seen  Product',
  'Notification Setting',
  'About',
  'Terms and Conditions',
  'Privacy Policy',

];
