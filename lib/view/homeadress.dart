import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/shared/components/components.dart';
import 'package:foodapp/shared/resources/assets_manager.dart';
import 'package:foodapp/shared/resources/color_manager.dart';
import 'package:foodapp/shared/resources/routes_manager.dart';

class home_address extends StatefulWidget {
  const home_address({Key? key}) : super(key: key);

  @override
  _home_addressState createState() => _home_addressState();
}

class _home_addressState extends State<home_address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:  ColorManager.whiteOpactity,appBar: AppBar(leading: builditemAppbar(context),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text(
                          'Home Address',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: ColorManager.black),
                        ),
                        SizedBox(width: 15),
                        defaultButton(
                            icon: true,
                            height: 25,
                            Iconbutton: Icons.done,
                            width: 110,
                            shape: false,
                            background: Colors.orangeAccent,
                            function: () {},
                            text: 'Default',
                            isUpperCase: false),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Robert Steven',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: ColorManager.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '08111455625',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: ColorManager.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '6019 Madison St',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: ColorManager.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'West New york , Nj 07093',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: ColorManager.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'USA',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: ColorManager.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 250.0),
                      child: TextButton(
                          onPressed: () {}, child: Text('Change Adress')),
                    ),
                  ],
                ),
              ),
            ),

            Card(shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        ),
              child: Container(height: 60,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Item : ',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.black)),
                          TextSpan(
                              text: '2',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.primary))
                        ]),
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: ColorManager.primary,
                              borderRadius: BorderRadius.circular(20)),
                          height: 10,
                          width: 10,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'On the way',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: ColorManager.black),
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              ),
            ),
           SizedBox(height: 380,
             child: ListView.separated(physics:const BouncingScrollPhysics(),itemBuilder: (context, index) {
               return  builditemAdress(context);
             }, separatorBuilder: (context, index) => Padding(
               padding: const EdgeInsets.symmetric(vertical: 8.0),
               child: myDivider(),
             ) , itemCount: 2),
           ),

            defaultButton(
                icon: true,
                height: 40,
                Iconbutton: Icons.arrow_forward_ios,sizeicon:10,Iconbutton2:Icons.directions_car_sharp,
                width: 380,
                shape: false,Textcolor:ColorManager.black,colorIcon:ColorManager.primary,colorIcon2:ColorManager.primary,
                background: ColorManager.white,  icon2:true,
    function: () {},
                text: 'Choose Delivery',
                isUpperCase: false),
            SizedBox(height: 10,),
            Card(shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
              child: Container(height: 60,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8.0),
                  child: Row(
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        Text(
                          'Sub Total',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: ColorManager.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '& 22.96',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: ColorManager.primary),
                        ),
                      ],),
                      Spacer(),
                      defaultButton(
                          icon: false,
                          height: 60,

                          width: 90,
                          shape: false,
                          background: Colors.orangeAccent,
                          function: () {

                          },
                          text: 'Pay',
                          isUpperCase: false),

                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
