import 'package:flutter/material.dart';
import 'views/screens/screens.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const SplashScreen(),
    ),
  );
}

/**
 * [] Update card on state change
 * [] Animate images depending on the toggle state
 */