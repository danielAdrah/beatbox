import 'package:flutter/material.dart';

class PlayerButton extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onPressed;

  const PlayerButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Image.asset(
              icon,
              width: 30,
              height: 30,
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
          ),
          Text(
            title,
            style: TextStyle(
                color: Theme.of(context).colorScheme.inverseSurface,
                fontSize: 13),
          ),
        ],
      ),
    );
  }
}
