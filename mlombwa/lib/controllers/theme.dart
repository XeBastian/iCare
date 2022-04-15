// Can be reused to suit your theme Needs => Colors etc...
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IcareTheme {
  static Color white = const Color(0XFFFFFFFF);
  static Color black = const Color(0XFF000000);
  static Color grey = Colors.grey;
  static Color green = const Color(0XFF4CAF50);
  static Color purple = const Color(0xFF454CC5);
  static Color darkBlue = const Color.fromARGB(255, 15, 143, 255);
  static Color lightBlue = const Color.fromARGB(255, 126, 195, 255);
  static Color darkBackgroundColor = const Color(0xFF010B14);
  static Color lightBackGroundColor = const Color(0xFFFFFFFF);
  static Color darkCardColor = const Color.fromARGB(255, 6, 31, 54);
  static Color lightCardColor = const Color.fromARGB(255, 226, 227, 236);
  static TextStyle inappLinksTextStyle = TextStyle(
    fontSize: bodyText2Size,
    color: Get.isDarkMode ? IcareTheme.darkBlue : IcareTheme.lightBlue,
    fontWeight: defaultFontWeight,
  );

  static String googleSansRegular = 'GoogleSans';
  static String googleSansBold = 'GoogleSansBold';
  static double bodyText1Size = 16.0;
  static double bodyText2Size = 14.0;
  static double headline1 = 36.0;
  static double headline2 = 28.0;
  static double headline3 = 22.0;
  static double headline4 = 20.0;
  static double headline5 = 16.0;
  static double headline6 = 14.0;
  static FontWeight defaultFontWeight = FontWeight.w500;

  static TextTheme lightTextTheme = TextTheme(
    bodyText1: TextStyle(
      fontFamily: googleSansRegular,
      fontSize: bodyText1Size,
      fontWeight: defaultFontWeight,
      color: black,
    ),
    bodyText2: TextStyle(
      fontFamily: googleSansRegular,
      fontSize: bodyText2Size,
      fontWeight: defaultFontWeight,
      color: black,
    ),
    headline1: TextStyle(
      fontFamily: googleSansBold,
      fontSize: headline1,
      fontWeight: FontWeight.bold,
      color: black,
    ),
    headline2: TextStyle(
      fontFamily: googleSansBold,
      fontSize: headline2,
      fontWeight: defaultFontWeight,
      color: black,
    ),
    headline3: TextStyle(
      fontFamily: googleSansBold,
      fontSize: headline3,
      fontWeight: defaultFontWeight,
      color: black,
    ),
    headline4: TextStyle(
      fontFamily: googleSansRegular,
      fontSize: headline4,
      fontWeight: defaultFontWeight,
      color: black,
    ),
    headline5: TextStyle(
      fontFamily: googleSansRegular,
      fontSize: headline5,
      fontWeight: defaultFontWeight,
      color: black,
    ),
    headline6: TextStyle(
      fontFamily: googleSansRegular,
      fontSize: headline6,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: TextStyle(
      fontFamily: googleSansRegular,
      fontSize: bodyText1Size,
      fontWeight: defaultFontWeight,
      color: white,
    ),
    bodyText2: TextStyle(
      fontFamily: googleSansRegular,
      fontSize: bodyText2Size,
      fontWeight: defaultFontWeight,
      color: white,
    ),
    headline1: TextStyle(
      fontFamily: googleSansBold,
      fontSize: headline1,
      color: white,
    ),
    headline2: TextStyle(
      fontFamily: googleSansBold,
      fontSize: headline2,
      color: white,
    ),
    headline3: TextStyle(
      fontFamily: googleSansRegular,
      fontSize: headline3,
      fontWeight: defaultFontWeight,
      color: white,
    ),
    headline4: TextStyle(
      fontFamily: googleSansRegular,
      fontSize: headline4,
      fontWeight: defaultFontWeight,
      color: white,
    ),
    headline5: TextStyle(
      fontFamily: googleSansRegular,
      fontSize: headline5,
      fontWeight: defaultFontWeight,
      color: white,
    ),
    headline6: TextStyle(
      fontFamily: googleSansRegular,
      fontSize: headline6,
      fontWeight: FontWeight.w500,
      color: Colors.white60,
    ),
  );

  static ThemeData? light() {
    return ThemeData(
      listTileTheme: const ListTileThemeData(style: ListTileStyle.drawer),
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) => black),
      ),
      appBarTheme: AppBarTheme(
        foregroundColor: black,
        backgroundColor: white,
        titleTextStyle: lightTextTheme.headline3,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: white,
        backgroundColor: black,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: green,
      ),
      textTheme: lightTextTheme,
      scaffoldBackgroundColor: white,
      primaryColor: purple,
    );
  }

  static ThemeData? dark() {
    return ThemeData(
      brightness: Brightness.dark,
      listTileTheme: const ListTileThemeData(style: ListTileStyle.drawer),
      appBarTheme: AppBarTheme(
        foregroundColor: white,
        backgroundColor: darkBackgroundColor,
        toolbarTextStyle: darkTextTheme.headline2,
        titleTextStyle: darkTextTheme.headline3,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: green,
        foregroundColor: white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: green,
      ),
      textTheme: darkTextTheme,
      scaffoldBackgroundColor: darkBackgroundColor,
    );
  }
}
