
import 'package:flutter/material.dart';
import 'package:foodapp/shared/resources/string_manager.dart';
import 'package:foodapp/view/services/addNewServices.dart';
import 'package:foodapp/view/customer/customer.dart';
import 'package:foodapp/view/services/detailservices.dart';
import 'package:foodapp/view/customer/editcustomer.dart';
import 'package:foodapp/view/services/editeDetailsservise.dart';
import 'package:foodapp/view/supliers/editsupplier.dart';
import 'package:foodapp/view/informationAbout.dart';
import 'package:foodapp/view/mapflutter.dart';
import 'package:foodapp/view/menu.dart';
import 'package:foodapp/view/orders.dart';
import 'package:foodapp/view/details.dart';
import 'package:foodapp/view/homeadress.dart';
import 'package:foodapp/view/login.dart';
import 'package:foodapp/view/profile.dart';
import 'package:foodapp/view/review.dart';
import 'package:foodapp/view/services/services.dart';
import 'package:foodapp/view/shopInfo.dart';
import 'package:foodapp/view/supliers/suppliers.dart';
import 'package:foodapp/view/walletexpense.dart';

class Routes{
  static const String menu_screen ='/';
  static const String details_screen ='/details';
  static const String home_address ='/homeAddress';
  static const String profile_screen ='/Profile';
  static const String review_screen ='/review';
  static const String service_screen ='/service';
  static const String addInformation_Screen ='/addInformation';
  static const String walletexpense_Screen ='/walletexpense';
  static const String shopInfo_screen ='/shopInfo';
  static const String Login_screen ='/Login';
  static const String customer_screen ='/customer';
  static const String order_screen ='/order';
  static const String addNewServices_Screen ='/addNewServices';
  static const String detailsservices_screen ='/detailsservices';
  static const String editedetailsServise_screen ='/editedetailsServise';
  static const String editcustomer_screen ='/editcustomer';
  static const String supplier_screen ='/supplier';
  static const String editsupplier_screen ='/editsupplier';
  static const String map_screen ='/map';





}
class RouteGenerator{
 static Route<dynamic>  getRoute(RouteSettings settings){
switch(settings.name){
  case Routes.menu_screen:
    return MaterialPageRoute(builder: (_)=>menu_screen());
  case Routes.details_screen:
    return MaterialPageRoute(builder: (_)=>details_screen());
  case Routes.home_address:
    return MaterialPageRoute(builder: (_)=>home_address());
  case Routes.profile_screen:
    return MaterialPageRoute(builder: (_)=>profile_screen());

  case Routes.service_screen:
    return MaterialPageRoute(builder: (_)=>service_screen());
  case Routes.addInformation_Screen:
    return MaterialPageRoute(builder: (_)=>addInformation_Screen());
  case Routes.walletexpense_Screen:
    return MaterialPageRoute(builder: (_)=>walletexpense_Screen());
  case Routes.shopInfo_screen:
    return MaterialPageRoute(builder: (_)=>shopInfo_screen());
  case Routes.Login_screen:
    return MaterialPageRoute(builder: (_)=>Login_screen());
  case Routes.customer_screen:
    return MaterialPageRoute(builder: (_)=>customer_screen());
  case Routes.addNewServices_Screen:
    return MaterialPageRoute(builder: (_)=>addNewServices_Screen());
  case Routes.detailsservices_screen:
    return MaterialPageRoute(builder: (_)=>detailsservices_screen());
  case Routes.editedetailsServise_screen:
    return MaterialPageRoute(builder: (_)=>editedetailsServise_screen());
  case Routes.order_screen:
    return MaterialPageRoute(builder: (_)=>order_screen());
  case Routes.editcustomer_screen:
    return MaterialPageRoute(builder: (_)=>editcustomer_screen());
  case Routes.supplier_screen:
    return MaterialPageRoute(builder: (_)=>supplier_screen());
  case Routes.editsupplier_screen:
    return MaterialPageRoute(builder: (_)=>editsupplier_screen());
  case Routes.map_screen:
    return MaterialPageRoute(builder: (_)=>map_screen());

  default:
    return unDefinedRoute();
}
  }
  static Route<dynamic>unDefinedRoute(){
   return MaterialPageRoute(builder: (_)=>Scaffold(
     appBar: AppBar(title: Text(AppStrings.noRoutefound),),body: Center(child: Text(AppStrings.noRoutefound),),
   ));
  }
}