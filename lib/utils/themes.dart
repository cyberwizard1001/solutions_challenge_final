  import 'package:flutter_blue_example/utils/colors.dart' as colors;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class darkTheme {
  static ThemeData get DarkTheme {
    return ThemeData(
        primaryTextTheme: TextTheme(bodyText1: GoogleFonts.nunito(color: colors.primaryTextColor)),
        primaryColor: Colors.white,
        scaffoldBackgroundColor: colors.scaffoldColor,
        iconTheme: IconThemeData(color: colors.primaryTextColor),
        appBarTheme: const AppBarTheme(
            elevation: 0, backgroundColor: Colors.transparent, centerTitle: true),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: colors.textBoxColor,
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colors.primaryTextColor)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: colors.primaryTextColor)),
          contentPadding: const EdgeInsets.all(10.0),
          labelStyle: GoogleFonts.nunito(color: colors.primaryTextColor),
          floatingLabelStyle:
          GoogleFonts.nunito(color: colors.primaryTextColor),
          hintStyle: GoogleFonts.nunito(color: colors.primaryTextColor),
        ),
        buttonTheme: ButtonThemeData(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            buttonColor: colors.primaryTextColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(colors.accentColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
              textStyle: MaterialStateProperty.all(GoogleFonts.nunito(color: colors.accentTextColor)),
            )),
        focusColor: colors.accentColor
    );
  }
}