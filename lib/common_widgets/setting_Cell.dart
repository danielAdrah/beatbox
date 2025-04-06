import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gradient_icon.dart';

class SettingCell extends StatelessWidget {
  const SettingCell(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle});
  final IconData icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onInverseSurface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GradientIcon(
            icon: icon,
            gradient: const LinearGradient(colors: [
              Color(0xFFda549a),
              Color(0xFFec8572),
            ]),
            size: 50,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
                color: Theme.of(context).colorScheme.inverseSurface,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
          const SizedBox(height: 5),
          Text(
            subTitle,
            style: const TextStyle(
                color: Colors.grey,
                //  Theme.of(context)
                //     .colorScheme
                //     .inverseSurface,
                fontWeight: FontWeight.w400,
                fontSize: 12),
          ),
        ],
      ),
    );
  }
}
