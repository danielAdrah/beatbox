// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/home_page.dart';

class SplashScreenController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  //=====
  void loadView() async {
    await Future.delayed(Duration(seconds: 3));
    Get.to(() => HomePage());
  }

  //===
  void openDrawer(){
    scaffoldKey.currentState?.openDrawer();
  }

  //===
  void closeDrawer(){
    scaffoldKey.currentState?.closeDrawer();
  }
}
