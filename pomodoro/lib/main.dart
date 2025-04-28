import 'package:flutter/material.dart';
import 'package:toonflix2/screens/home_screens.dart';

void main() {
  runApp(APP());
}

class APP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffE7626C),
        textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: Color(0xff232B55),
          ),
        ),
        cardColor: const Color(0xFFF4EDDB),
        ),
      home: const HomeScreen(),
    );
  }
}