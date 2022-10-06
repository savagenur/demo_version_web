import 'package:demo_version_web/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


final lightThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  primarySwatch: primaryColor,
  textTheme: GoogleFonts.ubuntuTextTheme(ThemeData.light().textTheme),
  elevatedButtonTheme: elevatedButtonThemeData,
  appBarTheme: appBarTheme,
);

final elevatedButtonThemeData = ElevatedButtonThemeData(
    style: TextButton.styleFrom(
        backgroundColor: primaryColor,
        padding: EdgeInsets.all(defaultPadding),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(
            defaultBorderRadius,
          ),
        ))));

final appBarTheme = AppBarTheme(
  backgroundColor: appBarColor,
);
