// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AllSection extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final VoidCallback onPress;
  const AllSection(
      {super.key,
      required this.title,
      required this.buttonTitle,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Row(
        children: [
          Expanded(
            child: FadeInLeft(
              delay: Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              child: Text(
                title,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inverseSurface,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          FadeInRight(
            delay: Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            child: TextButton(
              onPressed: onPress,
              child: Text(
                buttonTitle,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
