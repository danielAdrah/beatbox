// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/genre_tile.dart';
import '../common_widgets/gradient_icon.dart';
import '../controllers/genres_controller.dart';

class GenresTab extends StatefulWidget {
  const GenresTab({super.key});

  @override
  State<GenresTab> createState() => _GenresTabState();
}

class _GenresTabState extends State<GenresTab> {
  final genresController = Get.put(GenresController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ZoomIn(
        delay: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Center(
            child: const GradientIcon(
              icon: Icons.add,
              gradient: LinearGradient(colors: [
                Color(0xFFda549a),
                Color(0xFFec8572),
              ]),
              size: 35,
            ),
            //  Icon(Icons.add,
            //     color: Theme.of(context).colorScheme.primary, size: 35),
          ),
        ),
      ),
      body: Obx(
        () => GridView.builder(
          padding: EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1.4,
          ),
          itemCount: genresController.allList.length,
          itemBuilder: (context, index) {
            var gObj = genresController.allList[index];

            if (index % 2 == 0) {
              return FadeInLeft(
                delay: const Duration(milliseconds: 600),
                curve: Curves.linearToEaseOut,
                child: GenreTile(
                  gObj: gObj,
                  onPress: () {},
                ),
              );
            } else {
              return FadeInRight(
                delay: const Duration(milliseconds: 600),
                curve: Curves.linearToEaseOut,
                child: GenreTile(
                  gObj: gObj,
                  onPress: () {},
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
