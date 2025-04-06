// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AlbumSongRow extends StatelessWidget {
  final Map sObj;
  final VoidCallback onPress;
  final VoidCallback onpressPlay;
  final bool isPlay;
  const AlbumSongRow({
    super.key,
    required this.sObj,
    required this.onPress,
    required this.onpressPlay,
    this.isPlay = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: onpressPlay,
              icon: Icon(Icons.play_circle_fill, size: 25),
            ),
            Expanded(
              child: Text(
                sObj["name"],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              sObj["duration"],
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
            Container(
                width: 80,
                alignment: Alignment.centerRight,
                child: Icon(Icons.more_horiz_outlined)
                // isPlay
                //     ? Image.asset(
                //         "assets/img/eq_display.png",
                //         width: 60,
                //         height: 25,
                //       )
                //     : Image.asset(
                //         "assets/img/more.png",
                //         width: 25,
                //         height: 25,
                //       ),
                ),
          ],
        )
      ],
    );
  }
}
