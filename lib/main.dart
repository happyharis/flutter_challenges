import 'package:flutter/material.dart';
import 'package:flutter_challenges/2_travel_app_freebie/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
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
