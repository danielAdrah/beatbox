import 'dart:convert';

import 'package:beatbox/view/artist_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/gradient_icon.dart';
import '../common_widgets/gradient_text.dart';
import 'genres_tab.dart';
import 'main_music_tab.dart';
import 'playlist_tab.dart';
import 'settings_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List popularSongs = [];
  List books = [];
  List<String> headers = ["New", "PlayLists", "Artists", "Genres"];
  late ScrollController scrollCont;
  late TabController tabCont;
  int selectedIndex = 0;
  int currentTab = 0;

  //============
  readData() {
    DefaultAssetBundle.of(context)
        .loadString("assets/json/popularBooks.json")
        .then((s) {
      setState(() {
        popularSongs = json.decode(s);
      });
    });
    DefaultAssetBundle.of(context)
        .loadString("assets/json/books.json")
        .then((s) {
      setState(() {
        books = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    readData();
    tabCont = TabController(length: 3, vsync: this);
    scrollCont = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 80,
                            height: 30,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/img/logo.png"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const GradientText(
                            "BeatBox",
                            gradient: LinearGradient(colors: [
                              Color(0xFFda549a),
                              Color(0xFFec8572),
                            ]),
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const GradientIcon(
                              icon: Icons.search,
                              gradient: LinearGradient(colors: [
                                Color(0xFFda549a),
                                Color(0xFFec8572),
                              ]),
                              size: 30,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Get.to(const SettingsView());
                              Get.to(() => const SettingsView());
                            },
                            child: const GradientIcon(
                              icon: Icons.settings,
                              gradient: LinearGradient(colors: [
                                Color(0xFFda549a),
                                Color(0xFFec8572),
                              ]),
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                TabBar(
                  labelColor: Theme.of(context).colorScheme.primary,
                  unselectedLabelColor:
                      Theme.of(context).colorScheme.inverseSurface,
                  indicatorColor: Theme.of(context).colorScheme.primary,
                  dividerColor: Theme.of(context).colorScheme.onInverseSurface,
                  isScrollable: false,
                  tabs: headers.map<Widget>((e) {
                    return Tab(
                      child: Text(e),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: TabBarView(
                    children: [
                      MainMusicTab(
                        books: books,
                      ),
                      const PlaylistTab(),
                      const ArtistTab(),
                      const GenresTab(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
