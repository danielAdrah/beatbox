// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'gradient_text.dart';

class SongTile extends StatelessWidget {
  SongTile({
    super.key,
    required this.img,
    required this.title,
    required this.rate,
    required this.artist,
    required this.onTap,
  });
  final String img;
  final String title;
  final String rate;
  final String artist;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Hero(
              tag: img,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(img),
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GradientText(
                  title,
                  gradient: const LinearGradient(colors: [
                    Color(0xFFda549a),
                    Color(0xFFec8572),
                  ]),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
                // Text(
                //   title,
                // style: const TextStyle(
                //     fontWeight: FontWeight.w600, fontSize: 18),
                // ),
                Text(
                  artist,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
