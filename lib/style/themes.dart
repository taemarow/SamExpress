import 'package:flutter/material.dart';
import 'mycolors.dart';

//variable for the theme
ThemeData darkTheme = ThemeData(
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: MyColors.mainColor
  ),
  colorScheme: const ColorScheme.dark(),
  appBarTheme: AppBarTheme(backgroundColor: MyColors.mainColor),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: MyColors.mainColor,
    unselectedItemColor: MyColors.grey,
    showUnselectedLabels: true,
  ),
  iconTheme: IconThemeData(
    color: MyColors.bgColor
  ),
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: MyColors.bgColor),
    headline2: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: MyColors.red),
    headline3: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: MyColors.grey),
    
    bodyText1:
        TextStyle(fontSize: 18.0, fontFamily: 'Hind', color: MyColors.lightTheme),
    bodyText2:
        TextStyle(fontSize: 16.0, fontFamily: 'Hind', color: MyColors.grey),
  ),
);

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: MyColors.bgColor
  ),
  scaffoldBackgroundColor: MyColors.lightTheme,
  appBarTheme: AppBarTheme(
    backgroundColor: MyColors.mainColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: MyColors.mainColor,
    unselectedItemColor: MyColors.grey,
    showUnselectedLabels: true,
  ),
  iconTheme: IconThemeData(
    color: MyColors.mainColor
  ),
  textTheme:  TextTheme(
    headline1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: MyColors.bgColor),
    headline2: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: MyColors.red),
    headline3: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: MyColors.grey),
    
    bodyText1:
        TextStyle(fontSize: 18.0, fontFamily: 'Hind', color: Colors.black),
    bodyText2:
        TextStyle(fontSize: 16.0, fontFamily: 'Hind', color: MyColors.grey),
  ),
);
