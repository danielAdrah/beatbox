// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common_widgets/player_button.dart';
import '../components/play_pause_button.dart';
import '../components/song_progress.dart';
import '../services/song_handler.dart';
import '../services/uri_to_file.dart';

class SongDetailView extends StatefulWidget {
  Uri? artworkUrl;
  final MediaItem playingSong;
  final SongHandler songHandler;
  SongDetailView({
    super.key,
    required this.playingSong,
    this.artworkUrl,
    required this.songHandler,
  });

  @override
  State<SongDetailView> createState() => _SongDetailViewState();
}

class _SongDetailViewState extends State<SongDetailView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        leading: FadeInLeft(
          delay: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios,
                size: 25, color: Theme.of(context).colorScheme.inverseSurface),
          ),
        ),
        actions: [
          FadeInDown(
            delay: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
            child: PopupMenuButton<int>(
                color: const Color(0xff383B49),
                offset: const Offset(-10, 15),
                elevation: 1,
                icon: Icon(Icons.more_vert,
                    size: 30,
                    color: Theme.of(context).colorScheme.inverseSurface),
                padding: EdgeInsets.zero,
                onSelected: (selectIndex) {
                  // if (selectIndex == 9) {
                  //   Get.to(DriverMode(
                  //     songName: widget.songName,
                  //     artists: widget.artists,
                  //     imgUrl: widget.imgUrl,
                  //   ));
                  // }
                },
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                      value: 1,
                      height: 40,
                      child: Text(
                        "Social Share",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      height: 40,
                      child: Text(
                        "Playing Queue",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 3,
                      height: 40,
                      child: Text(
                        "Add to playlist...",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 4,
                      height: 40,
                      child: Text(
                        "Lyrics",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 5,
                      height: 40,
                      child: Text(
                        "Volume",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 6,
                      height: 40,
                      child: Text(
                        "Details",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 7,
                      height: 40,
                      child: Text(
                        "Sleep timer",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 8,
                      height: 40,
                      child: Text(
                        "Equaliser",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 9,
                      height: 40,
                      child: Text(
                        "Driver mode",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ];
                }),
          ),
        ],
        title: FadeInDown(
          delay: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
          child: Text("Now Playing",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  fontSize: 22,
                  fontWeight: FontWeight.w700)),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 25),
              ZoomIn(
                delay: const Duration(milliseconds: 250),
                curve: Curves.linearToEaseOut,
                child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFda549a),
                          Color(0xFFec8572),
                        ],
                      ),
                    ),
                    child: ArtWorkImage(
                        widget: widget, height: height, width: width)),
              ),
              SizedBox(height: 20),
              ZoomIn(
                delay: const Duration(milliseconds: 270),
                curve: Curves.linearToEaseOut,
                child: Text(
                  //the name of the song that i have click it
                  widget.playingSong.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 25),
              ZoomIn(
                delay: const Duration(milliseconds: 290),
                curve: Curves.linearToEaseOut,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PlayPauseButton(size: 40, songHandler: widget.songHandler),
                    const SizedBox(width: 8),
                    Image.asset("assets/img/eq_display.png",
                        height: 60, fit: BoxFit.fitHeight),
                    const SizedBox(width: 10),
                    IconButton(
                        onPressed: () {
                          widget.songHandler.fastForward();
                        },
                        icon: Icon(
                          CupertinoIcons.forward_end_alt_fill,
                          size: 30,
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ZoomIn(
                    delay: const Duration(milliseconds: 310),
                    curve: Curves.linearToEaseOut,
                    child:
                        _buildProgress(widget.playingSong.duration!, widget)),
              ),
              SizedBox(height: 30),
              FadeInLeft(
                delay: const Duration(milliseconds: 350),
                curve: Curves.linearToEaseOut,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PlayerButton(
                      icon: "assets/img/playlist.png",
                      title: "Play list",
                      onPressed: () {},
                    ),
                    PlayerButton(
                      icon: "assets/img/shuffle.png",
                      title: "Shuffle",
                      onPressed: () {},
                    ),
                    PlayerButton(
                      icon: "assets/img/repeat.png",
                      title: "Repeat",
                      onPressed: () {},
                    ),
                    PlayerButton(
                      icon: "assets/img/eq.png",
                      title: "EQ",
                      onPressed: () {},
                    ),
                    PlayerButton(
                      icon: "assets/img/fav.png",
                      title: "Favourites",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//========
class ArtWorkImage extends StatelessWidget {
  const ArtWorkImage({
    super.key,
    required this.widget,
    required this.height,
    required this.width,
  });

  final SongDetailView widget;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File?>(
      // Use the uriToFile function to convert Uri to File
      future: uriToFile(widget.artworkUrl),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          // Handle error, e.g., show a placeholder or log the error
          return const Icon(Icons.error_outline);
        }
        return Hero(
          tag: widget.playingSong.displayDescription!,
          child: CircleAvatar(
              radius: 130,
              backgroundImage: snapshot.data != null
                  ? FileImage(
                      snapshot.data!,
                    )
                  : const AssetImage("assets/img/logo.png")),
        );
      },
    );
  }
}

//========
Widget _buildProgress(Duration totalDuration, SongDetailView widget) {
  return ListTile(
    title:
        // isLast
        //     ? null
        //     :
        SongProgress(
            // Use SongProgress widget to display progress bar
            totalDuration: totalDuration,
            songHandler: widget.songHandler),
  );
}
