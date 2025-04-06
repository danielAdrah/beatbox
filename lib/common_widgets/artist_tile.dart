import 'package:flutter/material.dart';

import 'gradient_text.dart';

class ArtistTile extends StatelessWidget {
  const ArtistTile({
    super.key,
    required this.name,
    required this.albums,
    required this.songs,
    required this.img,
  });
  final String name;
  final String albums;
  final String songs;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 12, right: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onInverseSurface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(img),
            radius: 50,
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradientText(
                name,
                gradient: const LinearGradient(colors: [
                  Color(0xFFda549a),
                  Color(0xFFec8572),
                ]),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
              Text(
                albums,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              Text(
                songs,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
