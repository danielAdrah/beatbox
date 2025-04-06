import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/song_tile.dart';
import 'song_detail_view.dart';

class MainMusicTab extends StatefulWidget {
  const MainMusicTab({super.key, required this.books});
  final List books;

  @override
  State<MainMusicTab> createState() => _MainMusicTabState();
}

class _MainMusicTabState extends State<MainMusicTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.books.length,
      itemBuilder: (context, index) {
        var song = widget.books[index];
        return FadeInLeft(
          delay: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          child: SongTile(
            onTap: () {
              Get.to(() => SongDetailView(
                    img: song['img'],
                    name: song['title'],
                    artist: song['text'],
                    path: song['audio'],
                  ));
            },
            img: song['img'],
            rate: "${song['rating']}",
            title: song['title'],
            artist: song['text'],
          ),
        );
      },
    );
  }
}
