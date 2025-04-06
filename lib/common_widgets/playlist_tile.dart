// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'gradient_text.dart';

class PlaylistTile extends StatelessWidget {
  final Map sObj;
  final VoidCallback onPress;
  const PlaylistTile({
    super.key,
    required this.sObj,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  sObj["image"],
                  width: 130,
                  height: 80,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: 130,
                height: 80,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.inverseSurface),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ],
          ),
          SizedBox(height: 10),
          GradientText(
            sObj["name"],
            gradient: const LinearGradient(colors: [
              Color(0xFFda549a),
              Color(0xFFec8572),
            ]),
            style: TextStyle(
                color: Theme.of(context).colorScheme.inverseSurface,
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
         
        ],
      ),
    );
  }
}
