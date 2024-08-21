import 'package:flutter/material.dart';
import 'package:remote_home/views/widgets/donut_widget.dart';
import 'package:remote_home/utils/utils.dart';

import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(Dimensions.midSize),
        decoration: const BoxDecoration(color: Colours.backGround),
        child: Column(
          children: [
            const SizedBox(height: Dimensions.bigSize),
            FadeTransition(opacity: fadeAnimation, child: const TopBar()),
            const SizedBox(height: Dimensions.bigSize),
            const EnergySummaryCard(),
            const SizedBox(height: Dimensions.smallSize),
            DonutWidget(data: chartData),
            const SizedBox(height: Dimensions.smallSize),
            const ApplianceSection()
          ],
        ),
      ),
    );
  }
}
