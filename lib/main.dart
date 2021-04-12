import 'package:flutter/material.dart';
import 'package:flutter_challenges/2_travel_app_freebie/home_page.dart';
import 'package:flutter_challenges/3_ios_insta_profile/profile_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(InstaApp());
}

class InstaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insta App',
      theme: ThemeData(fontFamily: 'SF Pro'),
      home: InstaProfilePage(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: travelAppTheme,
      themeMode: ThemeMode.dark,
      home: HomePage(),
    );
  }
}

final travelAppTheme = ThemeData(
  buttonColor: Color.fromRGBO(47, 128, 237, 1),
  textTheme: TextTheme(
    headline1: GoogleFonts.raleway(
      fontSize: 29,
      fontWeight: FontWeight.w900,
      color: Colors.white,
    ),
    headline2: GoogleFonts.raleway(
      fontSize: 24,
      fontWeight: FontWeight.w900,
      color: Colors.white,
    ),
    subtitle1: GoogleFonts.raleway(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
);
