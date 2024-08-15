import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() {
  runApp(
    MaterialApp(
      theme:
          ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      home: const Scaffold(
        body: HomePage(),
      ),
    ),
  );
}

/*
::TODO::
[] Download icons for the app
[] Add animations
[] Create mock data and mock endpoints
[] Setup doughnut
[] Plan mockup for the second page
*/