// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';


class GenreTile extends StatelessWidget {
  final Map gObj;
  final VoidCallback onPress;
  const GenreTile({super.key, required this.gObj, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          gObj["image"],
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black45.withOpacity(0.5),
          width: double.maxFinite,
          height: double.maxFinite,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              gObj["name"],
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              gObj["songs"],
              style: TextStyle(
                  color:  Theme.of(context).colorScheme.inverseSurface,
                  fontSize: 10,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}
