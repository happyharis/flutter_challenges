import 'package:flutter/material.dart';
import 'package:flutter_challenges/1_fashion_profile/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fashion App',
      theme: ThemeData.dark(),
      home: ProfilePage(),
    );
  }
}
