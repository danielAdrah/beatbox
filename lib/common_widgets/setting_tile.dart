// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'gradient_icon.dart';

class SettingTile extends StatelessWidget {
  SettingTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.size,
  });
  final IconData icon;
  final String title;
  final String subTitle;
  double? size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GradientIcon(
              icon: icon,
              gradient: const LinearGradient(colors: [
                Color(0xFFda549a),
                Color(0xFFec8572),
              ]),
              size: size ?? 35,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
          ],
        ),
        Text(
          subTitle,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
