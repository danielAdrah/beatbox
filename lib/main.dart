// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'themes/bloc/theme_bloc.dart';
import 'themes/dark_theme.dart';
import 'view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc()..add(SetInitTheme()),
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, theme) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            // darkTheme: darkMode,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
