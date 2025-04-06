// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

import '../common_widgets/gradient_icon.dart';
import '../common_widgets/gradient_text.dart';
import 'audio_file.dart';

class SongDetailView extends StatefulWidget {
  const SongDetailView({
    super.key,
    required this.img,
    required this.name,
    required this.artist,
    required this.path,
  });
  final String img;
  final String name;
  final String artist;
  final String path;

  @override
  State<SongDetailView> createState() => _SongDetailViewState();
}

class _SongDetailViewState extends State<SongDetailView> {
  late AudioPlayer audioPlayer;
  String audioPath = "audio/testaudio.mp3";

  void playSound() async {
    try {
      // Load and play the sound file
      await audioPlayer.play(AssetSource(audioPath));
    } catch (e) {
      print("Error playing sound: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      audioPlayer.stop();
                      Get.back();
                    },
                    icon: const GradientIcon(
                      icon: Icons.arrow_back_ios,
                      gradient: LinearGradient(colors: [
                        Color(0xFFda549a),
                        Color(0xFFec8572),
                      ]),
                      size: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 7),
              Center(
                child: Container(
                  width: width / 1.3,
                  height: height / 2.9,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(1.5, 2),
                        blurRadius: 2,
                        blurStyle: BlurStyle.solid,
                      )
                    ],
                    borderRadius: BorderRadius.circular(20),
                    // image: DecorationImage(
                    //     image: AssetImage(widget.img), fit: BoxFit.fill),
                  ),
                  child: Hero(
                      tag: widget.img,
                      child: Image.asset(widget.img, fit: BoxFit.fill)),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText(
                          widget.name,
                          gradient: const LinearGradient(colors: [
                            Color(0xFFda549a),
                            Color(0xFFec8572),
                          ]),
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 23),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.artist,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(
                        CupertinoIcons.ellipsis_vertical_circle,
                        color: Colors.grey,
                        size: 32,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: height / 15),
              AudioFile(
                audioPlayer: audioPlayer,
                path: widget.path,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
