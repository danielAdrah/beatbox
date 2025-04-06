// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/album_song_row.dart';
import '../common_widgets/all_section.dart';
import '../common_widgets/artist_album_cell.dart';
import '../common_widgets/gradient_icon.dart';
import '../common_widgets/gradient_text.dart';
import '../controllers/artist_controller.dart';

class ArtistDetailView extends StatefulWidget {
  final String imgUrl;
  final String name;
  final String album;
  final String song;
  const ArtistDetailView(
      {super.key,
      required this.imgUrl,
      required this.name,
      required this.album,
      required this.song});

  @override
  State<ArtistDetailView> createState() => _ArtistDetailViewState();
}

class _ArtistDetailViewState extends State<ArtistDetailView>
    with SingleTickerProviderStateMixin {
  final artistController = Get.put(ArtistsController());
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        leading: FadeInLeft(
          delay: const Duration(milliseconds: 600),
          curve: Curves.easeIn,
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: GradientIcon(
              icon: Icons.arrow_back_ios,
              gradient: LinearGradient(colors: [
                Color(0xFFda549a),
                Color(0xFFec8572),
              ]),
              size: 25,
            ),
          ),
        ),
        actions: [
          FadeInRight(
            delay: const Duration(milliseconds: 600),
            curve: Curves.easeIn,
            child: IconButton(
              onPressed: () {},
              icon: GradientIcon(
                icon: Icons.search,
                gradient: LinearGradient(colors: [
                  Color(0xFFda549a),
                  Color(0xFFec8572),
                ]),
                size: 25,
              ),
            ),
          ),
        ],
        title: FadeInDown(
          delay: const Duration(milliseconds: 600),
          curve: Curves.easeIn,
          child: GradientText("Details",
              gradient: LinearGradient(colors: [
                Color(0xFFda549a),
                Color(0xFFec8572),
              ]),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  FadeInDown(
                    delay: const Duration(milliseconds: 700),
                    curve: Curves.linearToEaseOut,
                    child: ClipRect(
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Image.asset(
                          widget.imgUrl,
                          // "assets/img/artitst_detail_top.png",
                          width: double.maxFinite,
                          height: media.width * 0.5,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeInLeft(
                              delay: const Duration(milliseconds: 650),
                              curve: Curves.linearToEaseOut,
                              child: Hero(
                                tag: widget.imgUrl,
                                child: Image.asset(
                                  // "assets/img/alb_1.png",
                                  widget.imgUrl,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: FadeInDown(
                                delay: const Duration(milliseconds: 660),
                                curve: Curves.linearToEaseOut,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // "History",
                                      widget.name,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 7),
                                    Text(
                                      "${widget.album} . ${widget.song}",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.74),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 7),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        FadeInLeft(
                          delay: const Duration(milliseconds: 600),
                          curve: Curves.linearToEaseOut,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(18),
                                onTap: () {},
                                child: Container(
                                  width: 80,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xffD9519D),
                                          Color(0xffED8770)
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.center),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // SizedBox(width: 8),
                                      Text(
                                        "Follow",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.74),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "125,035",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Followers",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              AllSection(
                title: "Top Albums",
                buttonTitle: "View All",
                onPress: () {},
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    itemCount: artistController.albumsArr.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var mObj = artistController.albumsArr[index];
                      return ZoomIn(
                        delay: const Duration(milliseconds: 700),
                        curve: Curves.linearToEaseOut,
                        child: ArtistAlbumCell(
                          mObj: mObj,
                          width: 1,
                        ),
                      );
                    }),
              ),
              AllSection(
                title: "Top Songs",
                buttonTitle: "View All",
                onPress: () {},
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemCount: artistController.playedArr.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var mObj = artistController.playedArr[index];
                    return FadeInLeft(
                      delay: const Duration(milliseconds: 750),
                      curve: Curves.linearToEaseOut,
                      child: AlbumSongRow(
                        sObj: mObj,
                        onPress: () {},
                        onpressPlay: () {},
                        isPlay: index == 0,
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
