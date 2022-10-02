import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/bloc/cubic.dart';
import 'package:foodapp/bloc/states.dart';
import 'package:foodapp/shared/components/components.dart';
import 'package:foodapp/shared/resources/assets_manager.dart';
import 'package:foodapp/shared/resources/color_manager.dart';
import 'package:foodapp/shared/resources/routes_manager.dart';

class menu_screen extends StatefulWidget {
  const menu_screen({Key? key}) : super(key: key);

  @override
  _menu_screenState createState() => _menu_screenState();
}

class _menu_screenState extends State<menu_screen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubic, AppStates>(
      listener: (context, state) {
        if(state is ConnectionDoneEnternetState){
          ShowToast(
              text: ' Connection Enternet Done ', state: Toaststates.SUCCESS);
        }else if(state is ErrorcheckEnternetState){
          ShowToast(
              text: ' Connection Enternet failed ', state: Toaststates.ERROR);
        }
        if(state is SuccessPositionState){
          ShowToast(
              text: ' Get Location Done ', state: Toaststates.SUCCESS);
        }else  if(state is PermissionfailedState){
          ShowToast(
              text: ' Need Permission to get Location  ', state: Toaststates.ERROR);
        }
      },
      builder: (context, state) {
        var cubic = AppCubic.get(context);

        return Scaffold(
          appBar: AppBar(),
          drawer: Drawer(
            elevation: 8.0,
            child: ListView(
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: 65,
                        child: CircleAvatar(
                          backgroundColor: Colors.orangeAccent[100],
                          radius: 60,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(ImageAssets.person),
                            //NetworkImage
                            radius: 50,
                          ), //CircleAvatar
                        ), //CircleAvatar
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Food',
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.orangeAccent,
                                  fontWeight: FontWeight.w800)),
                          TextSpan(
                              text: '-App',
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.orangeAccent))
                        ]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'mr/mohamed',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'mohamed@mail.com',
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  height: 250,
                ),
                Divider(
                  color: Colors.black38,
                ),
                ListTile(
                  onTap: () {
                    cubic.ChangePage(1);
                    Navigator.pushReplacementNamed(
                        context, Routes.Login_screen);

                  },
                  title: Text('Login',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:cubic.CurrentPage==1?ColorManager.primary: ColorManager.black, )),
                  leading: Icon(
                    Icons.login,
                    color:cubic.CurrentPage==1?ColorManager.primary: ColorManager.black,
                  ),
                ),
                ListTile(
                  onTap: () {
                    cubic.ChangePage(2);
                    Navigator.pushReplacementNamed(
                        context, Routes.profile_screen);

                    Navigator.pushReplacementNamed(
                        context, Routes.profile_screen);
                  },
                  title: Text('profile',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:cubic.CurrentPage==2?ColorManager.primary: ColorManager.black, )),
                  leading: Icon(
                    Icons.person,
                    color:cubic.CurrentPage==2?ColorManager.primary: ColorManager.black,
                  ),
                ),
                ListTile(
                  onTap: () {
                    cubic.ChangePage(3);
                    Navigator.pushReplacementNamed(
                        context, Routes.order_screen);
                  },
                  title: Text('order',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:cubic.CurrentPage==3?ColorManager.primary: ColorManager.black, )),
                  leading: Icon(
                    Icons.border_horizontal,
                    color:cubic.CurrentPage==3?ColorManager.primary: ColorManager.black,
                  ),
                ),
                ListTile(
                  onTap: () {
                    cubic.ChangePage(4);
                    Navigator.pushReplacementNamed(
                        context, Routes.shopInfo_screen);
                  },
                  title: Text('shop Info',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:cubic.CurrentPage==4?ColorManager.primary: ColorManager.black, )),
                  leading: Icon(
                    Icons.shop,
                    color:cubic.CurrentPage==4?ColorManager.primary: ColorManager.black,
                  ),
                ),
                ListTile(
                  onTap: () {
                    cubic.ChangePage(5);
                    Navigator.pushReplacementNamed(
                        context, Routes.service_screen);
                  },
                  title: Text('service',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:cubic.CurrentPage==5?ColorManager.primary: ColorManager.black, )),
                  leading: Icon(
                    Icons.design_services,
                    color:cubic.CurrentPage==5?ColorManager.primary: ColorManager.black,
                  ),
                ),
                ListTile(
                  onTap: () {
                    cubic.ChangePage(6);
                    Navigator.pushReplacementNamed(
                        context, Routes.home_address);
                  },
                  title: Text('Home Address',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:cubic.CurrentPage==6?ColorManager.primary: ColorManager.black,) ),
                  leading: Icon(
                    Icons.home,
                    color:cubic.CurrentPage==6?ColorManager.primary: ColorManager.black,
                  ),
                ),
                ListTile(
                  onTap: () {
                    cubic.ChangePage(7);
                    Navigator.pushReplacementNamed(
                        context, Routes.supplier_screen);
                  },
                  title: Text('Supplier',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:cubic.CurrentPage==7?ColorManager.primary: ColorManager.black,)),
                  leading: Icon(
                    Icons.supervisor_account,
                    color:cubic.CurrentPage==7?ColorManager.primary: ColorManager.black,
                  ),
                ),
                ListTile(
                  onTap: () {
                    cubic.ChangePage(8);
                    Navigator.pushReplacementNamed(
                        context, Routes.customer_screen);
                  },
                  title: Text('Customer',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:cubic.CurrentPage==8?ColorManager.primary: ColorManager.black,)),
                  leading: Icon(
                    Icons.supervisor_account,
                    color:cubic.CurrentPage==8?ColorManager.primary: ColorManager.black,
                  ),
                ),
                ListTile(
                  onTap: () {
                    cubic.ChangePage(9);
                    Navigator.pushReplacementNamed(
                        context, Routes.details_screen);
                  },
                  title: Text('Details',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:cubic.CurrentPage==9?ColorManager.primary: ColorManager.black,)),
                  leading: Icon(
                    Icons.details,
                    color:cubic.CurrentPage==9?ColorManager.primary: ColorManager.black,
                  ),
                ),
                ListTile(
                  onTap: () {
                    cubic.ChangePage(10);
                    Navigator.pushReplacementNamed(
                        context, Routes.walletexpense_Screen);
                  },
                  title: Text('Wallet Expense',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:cubic.CurrentPage==10?ColorManager.primary: ColorManager.black,)),
                  leading: Icon(
                    Icons.wallet_giftcard,
                    color:cubic.CurrentPage==10?ColorManager.primary: ColorManager.black,
                  ),
                ),
                ListTile(
                  onTap: () {
                    cubic.ChangePage(11);
                    Navigator.pushReplacementNamed(
                        context, Routes.addInformation_Screen);
                  },
                  title: Text('Add Information',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:cubic.CurrentPage==11?ColorManager.primary: ColorManager.black,)),
                  leading: Icon(
                    Icons.wallet_giftcard,
                    color:cubic.CurrentPage==11?ColorManager.primary: ColorManager.black,
                  ),
                ),
                ListTile(
                  onTap: () {
                    cubic.getCurrentLocation();
cubic. listmarkers(cubic.myLocation!.latitude,cubic.myLocation!.latitude,false);
                   if(cubic.myLocation != null)
                    Navigator.pushReplacementNamed(
                        context, Routes.map_screen);
                  },
                  title: Text('Map',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:cubic.CurrentPage==12?ColorManager.primary: ColorManager.black,)),
                  leading: Icon(
                    Icons.location_on,
                    color:cubic.CurrentPage==12?ColorManager.primary: ColorManager.black,
                  ),
                ),
                ListTile(
                  onTap: () {



                    Navigator.pushReplacementNamed(
                        context, Routes.review_screen);
                  },
                  title: Text('Review',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:cubic.CurrentPage==13?ColorManager.primary: ColorManager.black,)),
                  leading: Icon(
                    Icons.reviews,
                    color:cubic.CurrentPage==13?ColorManager.primary: ColorManager.black,
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            color: ColorManager.white,
          ),
        );
      },
    );
  }
}
