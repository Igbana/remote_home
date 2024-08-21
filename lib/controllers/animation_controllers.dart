import 'package:flutter/material.dart';

class FadeAnimation extends AnimationController {
  FadeAnimation({required super.vsync});

  Animation<double> fade() {
    return Tween<double>(begin: 0, end: 1).animate(this);
  }

  void startAnimation() {
    forward();
  }
}
