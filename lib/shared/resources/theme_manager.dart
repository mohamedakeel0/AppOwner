import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodapp/shared/resources/color_manager.dart';
import 'package:foodapp/shared/resources/font_manager.dart';
import 'package:foodapp/shared/resources/styles_manager.dart';
import 'package:foodapp/shared/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primarySwatch: Colors.orange,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManager.primary,
    ),
    appBarTheme: AppBarTheme(
        titleSpacing: 20,
        backgroundColor: ColorManager.primary,
        backwardsCompatibility: false,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.primary,
            statusBarBrightness: Brightness.light),
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.black)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorManager.primary,
        unselectedItemColor: Colors.black45,
        elevation: 30),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black)),

  );
}
