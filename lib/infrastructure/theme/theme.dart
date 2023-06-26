import 'package:flutter/material.dart';
import 'colors.theme.dart';

ThemeData themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: ColorsTheme.colPrimary,
    primary: ColorsTheme.colPrimary,
    secondary: ColorsTheme.colSecondary,
    brightness: Brightness.dark,
    background: ColorsTheme.colBackground,
  ),
  backgroundColor:  ColorsTheme.colBackground,
  primaryColor:ColorsTheme.colPrimary,
  hintColor: ColorsTheme.colHint,
  fontFamily: "Satoshi",
  scaffoldBackgroundColor: Colors.white,
);