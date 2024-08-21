import 'package:flutter/material.dart';

class ScheduleTime {
  const ScheduleTime({required this.powerOn, required this.powerOff});
  final TimeOfDay powerOn;
  final TimeOfDay powerOff;
}
