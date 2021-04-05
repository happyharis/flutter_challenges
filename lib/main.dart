import 'package:flutter/material.dart';
import 'package:flutter_challenges/2_travel_app_freebie/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      themeMode: ThemeMode.dark,
      home: HomePage(),
    );
  }
}
