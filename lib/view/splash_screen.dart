import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/gradient_text.dart';
import '../controllers/splash_screen_controller.dart';
import '../services/song_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.songHandler});
  final SongHandler songHandler;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashController = Get.put(SplashScreenController());
  @override
  void initState() {
    super.initState();
    splashController.loadView(widget.songHandler);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZoomIn(
              curve: Curves.easeIn,
              delay: const Duration(milliseconds: 600),
              child: Image.asset(
                "assets/img/logo.png",
                width: width * 0.9,
                // height: height * 0.9,
              ),
            ),
            ZoomIn(
              curve: Curves.easeOut,
              delay: const Duration(milliseconds: 800),
              child: const GradientText(
                "BeatBox",
                gradient: LinearGradient(colors: [
                  Color(0xFFda549a),
                  Color(0xFFec8572),
                ]),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
