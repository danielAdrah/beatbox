// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/all_section.dart';
import '../common_widgets/gradient_icon.dart';
import '../common_widgets/playlist_cell.dart';
import '../common_widgets/playlist_tile.dart';
import '../controllers/playlist_controller.dart';

class PlaylistTab extends StatefulWidget {
  const PlaylistTab({super.key});

  @override
  State<PlaylistTab> createState() => _PlaylistTabState();
}

class _PlaylistTabState extends State<PlaylistTab> {
  final playListController = Get.put(PlaylistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ZoomIn(
        delay: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Center(
            child: GradientIcon(
              icon: Icons.add,
              gradient: LinearGradient(colors: [
                Color(0xFFda549a),
                Color(0xFFec8572),
              ]),
              size: 35,
            ),
            //  Icon(Icons.add,
            //     color: Theme.of(context).colorScheme.primary, size: 35),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: 15),
            AllSection(
                title: "My PlayList", buttonTitle: "View all", onPress: () {}),
            Obx(
              () => GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 20, top: 10, left: 15),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemCount: playListController.playlistArr.length,
                itemBuilder: (context, index) {
                  var sObj = playListController.playlistArr[index];
                  return ZoomIn(
                    delay: Duration(milliseconds: 600),
                    curve: Curves.linearToEaseOut,
                    child: PlayListCell(
                      onPress: () {},
                      onPressPlay: () {},
                      sObj: sObj,
                    ),
                  );
                },
              ),
            ),

            //this to display playlist
            AllSection(
                title: "Most Played", buttonTitle: "View all", onPress: () {}),
            SizedBox(
              height: 150,
              child: Obx(
                () => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: playListController.myPlaylistArr.length,
                  itemBuilder: (context, index) {
                    var sObj = playListController.myPlaylistArr[index];
                    return Container(
                      // padding: const EdgeInsets.symmetric(horizontal: 5),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: ZoomIn(
                        delay: Duration(milliseconds: 700),
                        curve: Curves.linearToEaseOut,
                        child: PlaylistTile(
                          onPress: () {},
                          sObj: sObj,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
