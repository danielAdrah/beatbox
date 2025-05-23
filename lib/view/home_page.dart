import 'package:animate_do/animate_do.dart';
import 'package:beatbox/view/main_tabs/artist_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common_widgets/gradient_icon.dart';
import '../common_widgets/gradient_text.dart';
import '../services/song_handler.dart';
import 'main_tabs/genres_tab.dart';
import 'main_tabs/playlist_tab.dart';
import 'settings_view.dart';
import 'search_screen.dart';
import 'main_tabs/songs_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.songHandler});
  final SongHandler songHandler;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<String> headers = ["New", "PlayLists", "Artists", "Genres"];
  late ScrollController scrollCont;
  late TabController tabCont;
  int selectedIndex = 0;
  int currentTab = 0;

  @override
  void initState() {
    super.initState();

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
                  child: FadeInDown(
                    delay: const Duration(milliseconds: 800),
                    curve: Curves.easeInOutCirc,
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
                              onPressed: () => Get.to(
                                () => SearchScreen(
                                    songHandler: widget.songHandler),
                                duration: const Duration(milliseconds: 700),
                                transition: Transition.rightToLeft,
                              ),
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
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 700),
                  curve: Curves.easeOut,
                  child: TabBar(
                    labelColor: const Color(0xffD9519D),
                    unselectedLabelColor:
                        Theme.of(context).colorScheme.inverseSurface,
                    indicatorColor: const Color(0xffD9519D),
                    dividerColor:
                        Theme.of(context).colorScheme.onInverseSurface,
                    isScrollable: false,
                    tabs: headers.map<Widget>((e) {
                      return Tab(
                        child: Text(e),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: TabBarView(
                    children: [
                      SongsTab(songHandler: widget.songHandler),
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
