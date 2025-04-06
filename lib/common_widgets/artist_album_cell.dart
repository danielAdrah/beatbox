// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


class ArtistAlbumCell extends StatelessWidget {
  final Map mObj;
  final double width;
  const ArtistAlbumCell({super.key, required this.mObj, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90, 
      // height: 210,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              mObj["image"],
              width: double.maxFinite,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 12),
          Text(
            mObj["name"],
            style: TextStyle(
                color:Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600),
          ),
          Text(
            mObj["year"],
            style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
