// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/song_handler.dart';
import '../view/home_page.dart';

class SplashScreenController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  //=====
  void loadView( SongHandler songHandler) async {
    await Future.delayed(Duration(seconds: 3));
    Get.to(() => HomePage(songHandler: songHandler,));
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
