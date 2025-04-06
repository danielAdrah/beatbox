import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class MusicTab extends StatelessWidget {
   MusicTab({super.key, required this.title, required this.color, this.onTap});
  final String title;
  final Color color;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color:color,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 3,
                offset: const Offset(0, 0.5),
              ),
            ]),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: AppColor.white),
          ),
        ),
      ),
    );
  }
}
