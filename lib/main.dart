// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '/pages/meals_details_page.dart';
import '/pages/tabs_screen.dart';
import '/pages/category_meals_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xff25CCF7),
          secondary: Color(0xffFEA47F),
        ),
        fontFamily: GoogleFonts.ubuntu().fontFamily,
        textTheme: TextTheme(
          headline2: GoogleFonts.dancingScript(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ), //googlefonts
          headline4: TextStyle(
            fontSize: 24,
            color: Colors.grey[900],
          ),
          headline5: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          caption: GoogleFonts.bubblegumSans(
            fontSize: 26,
            color: Colors.grey[50],
          ),
        ),
      ),
      home: TabsScreen(),
      routes: {
        CategoryMealsPage.routeName: (ctx) => CategoryMealsPage(),
        MealsDetailsPage.routeName: (ctx) => MealsDetailsPage(),
      },
    );
  }
}
