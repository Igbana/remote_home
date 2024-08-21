import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:remote_home/models/models.dart';
import 'package:remote_home/views/widgets/add_appliance_card.dart';

final List<Appliance> appliances = [
  Appliance(
    name: "TV",
    isOn: false,
    wattage: 10,
    icon: Icons.tv,
    runTime: const Duration(hours: 2, minutes: 45),
    image: Lottie.asset("assets/animations/tv.json"),
  ),
  Appliance(
    name: "Smart Fan",
    isOn: true,
    wattage: 1,
    icon: Icons.ac_unit,
    runTime: const Duration(minutes: 25),
    image: Lottie.asset("assets/animations/fan.json"),
  ),
  Appliance(
    name: "Smart Lamp",
    isOn: false,
    wattage: 3,
    icon: Icons.light,
    runTime: const Duration(hours: 1, minutes: 5),
    image: Lottie.asset("assets/animations/bulb_glow.json"),
  ),
];
