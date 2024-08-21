import 'package:flutter/material.dart';
import 'package:remote_home/models/schedule_time.dart';

class Appliance {
  Appliance({
    required this.name,
    required this.isOn,
    required this.icon,
    required this.image,
    this.runTime = Duration.zero,
    this.wattage = 0,
    this.scheduleTime,
  });
  final String name;
  final IconData icon;
  final Widget image;
  double wattage;
  Duration runTime;
  bool isOn;
  ScheduleTime? scheduleTime;

  void toggle(bool state) {
    isOn = state;
    runTime = Duration.zero;
  }

  String getRunTime() {
    String hour = runTime.toString().split(':')[0];
    hour = int.parse(hour) < 10 ? "0$hour" : hour;

    String minute = runTime.toString().split(':')[1];
    minute = int.parse(minute) < 10 ? "0$minute" : minute;

    return "${hour}hr ${minute}min";
  }
}
