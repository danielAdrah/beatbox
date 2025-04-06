import 'package:beatbox/controllers/artist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/artist_tile.dart';
import 'artist_detail_view.dart';

class ArtistTab extends StatefulWidget {
  const ArtistTab({super.key});

  @override
  State<ArtistTab> createState() => _ArtistTabState();
}

class _ArtistTabState extends State<ArtistTab> {
  final artistCont = Get.put(ArtistsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: artistCont.allList.length,
        itemBuilder: (context, index) {
          var artist = artistCont.allList[index];
          return InkWell(
            onTap: () {
              Get.to(() => ArtistDetailView(
                    name: artist['name'] ?? "",
                    album: artist['albums'] ?? "",
                    imgUrl: artist['image'] ?? "",
                    song: artist['songs'] ?? "",
                  ));
            },
            child: ArtistTile(
              name: artist['name'] ?? "",
              albums: artist['albums'] ?? "",
              songs: artist['songs'] ?? "",
              img: artist['image'] ?? "",
            ),
          );
        },
      ),
    );
  }
}
