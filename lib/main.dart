// ignore_for_file: prefer_const_constructors
import 'package:audio_service/audio_service.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'notifiers/songs_provider.dart';
import 'services/song_handler.dart';
import 'themes/theme_provider.dart';
import 'view/splash_screen.dart';

SongHandler _songHandler = SongHandler();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  _songHandler = await AudioService.init(
    builder: () => SongHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.beatbox',
      androidNotificationChannelName: 'beatbox',
      androidNotificationOngoing: true,
      androidShowNotificationBadge: true,

    ),
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SongsProvider()..loadSongs(_songHandler),
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? light, ColorScheme? dark) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Provider.of<ThemeProvider>(context).themeData,
          home: SplashScreen(songHandler: _songHandler),
        );
      },
    );

   
  }
}
