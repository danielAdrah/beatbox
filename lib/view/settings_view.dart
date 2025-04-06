import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common_widgets/setting_Cell.dart';
import '../common_widgets/setting_tile.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  List<IconData> icons = [
    CupertinoIcons.moon,
    CupertinoIcons.music_note,
    CupertinoIcons.waveform,
    CupertinoIcons.heart
  ];
  List<String> titles = ["Theme", "Ringtone", "Equalizer", "Favorite"];
  List<String> subTitles = [
    "Dark/Light",
    "Select a song",
    "Select a mode",
    "Your favorite",
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.surface),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // const SizedBox(height: 30),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: width,
                height: height / 2.5,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 140,
                    childAspectRatio: 160,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (index == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              padding:const EdgeInsets.symmetric(
                                  vertical: 50, horizontal: 25),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .onInverseSurface,
                              content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Dark Theme :",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inverseSurface),
                                  ),
                                  CupertinoSwitch(
                                      value: false, onChanged: (bool val) {}),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                      child: SettingCell(
                        icon: icons[index],
                        title: titles[index],
                        subTitle: subTitles[index],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 17),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: height / 29, horizontal: height / 50),
                  width: width,
                  // height: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      SettingTile(
                        icon: Icons.play_arrow_rounded,
                        title: "Playing Time",
                        subTitle: "295h",
                      ),
                      SizedBox(height: height / 30),
                      SettingTile(
                        icon: Icons.visibility_off,
                        title: "Hidden Files",
                        subTitle: "42",
                        // size: 30,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 17),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: height / 29, horizontal: height / 50),
                  width: width,
                  // height: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      SettingTile(
                        icon: CupertinoIcons.text_bubble,
                        title: "Rate Us",
                        subTitle: "",
                      ),
                      SizedBox(height: height / 30),
                      SettingTile(
                        icon: Icons.security_outlined,
                        title: "Privacy Policy",
                        subTitle: "",
                        // size: 30,
                      ),
                      SizedBox(height: height / 30),
                      SettingTile(
                        icon: Icons.info_outline,
                        title: "About",
                        subTitle: "",
                        // size: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
