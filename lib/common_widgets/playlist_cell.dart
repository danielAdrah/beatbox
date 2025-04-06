// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class PlayListCell extends StatelessWidget {
  final Map sObj;
  final VoidCallback onPress;
  final VoidCallback onPressPlay;
  const PlayListCell({
    super.key,
    required this.sObj,
    required this.onPress,
    required this.onPressPlay,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          sObj["image"],
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit.cover,
        ),
        // Container(
        //   width: double.maxFinite,
        //   height: double.maxFinite,
        //   color: Colors.black45,
        // ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      sObj["name"],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4),
                    Text(
                      sObj["songs"],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.play_circle_fill,
                  size: 35,
                  color: Colors.white,
                ),
                onPressed: onPressPlay,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
