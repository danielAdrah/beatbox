import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dark_theme.dart';
import '../light_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(lightMode) {
    on<SetInitTheme>(
      (event, emit) async {
        bool hasDarkTheme = await isDark();
        emit(hasDarkTheme ? darkMode : lightMode);
      },
    );

    on<SwitchThemeEvent>(
      (event, emit) async {
        bool hasThemeDark = state == darkMode;
        emit(hasThemeDark ? lightMode : darkMode);
        setTheme(!hasThemeDark);
      },
    );
  }
}

Future<bool> isDark() async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getBool('isDark') ?? false;
}

Future<void> setTheme(bool isDark) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setBool('isDark', isDark);
}
