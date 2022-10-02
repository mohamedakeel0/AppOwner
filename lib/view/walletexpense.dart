import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/bloc/cubic.dart';
import 'package:foodapp/bloc/states.dart';
import 'package:foodapp/shared/components/components.dart';
import 'package:foodapp/shared/resources/routes_manager.dart';

class walletexpense_Screen extends StatefulWidget {
  const walletexpense_Screen({Key? key}) : super(key: key);

  @override
  _walletexpense_ScreenState createState() => _walletexpense_ScreenState();
}

class _walletexpense_ScreenState extends State<walletexpense_Screen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubic, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {

          var cubic = AppCubic.get(context);

          return Scaffold(appBar: AppBar(leading: builditemAppbar(context),),
            body: Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: 20,),
                      Text(
                        'The Accounts',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: 5,),
                      SizedBox(
                        height: 150,
                        child: GridView.count(
                          crossAxisCount: 3,
                          childAspectRatio: 1.18,
                          children: [
                            buildItemCridView(
                                'المصروفات', '17.977', Colors.blue, 250.0, 30.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: buildItemCridView('المبيعات', '301.251',
                                  Colors.deepPurpleAccent, 250.0, 30.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: buildItemCridView(
                                  'المكسب', '8.702', Colors.green, 250.0, 30.0),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Clients',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height:183*11,width:double.infinity,
                        child:   ListView.separated(physics: NeverScrollableScrollPhysics(),itemBuilder: (context, index) {

                          return builditemwallexpense(context,false,Routes.editsupplier_screen,cubic.modeledite!);

                        }, separatorBuilder: (context, index) => myDivider() , itemCount: 10),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );

        });

  }
}
