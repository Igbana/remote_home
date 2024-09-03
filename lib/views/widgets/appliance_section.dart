import 'package:flutter/material.dart';
import 'package:remote_home/controllers/controllers.dart';
import 'package:remote_home/utils/utils.dart';
import 'widgets.dart';

class ApplianceSection extends StatefulWidget {
  const ApplianceSection({
    super.key,
  });

  @override
  State<ApplianceSection> createState() => _ApplianceSectionState();
}

class _ApplianceSectionState extends State<ApplianceSection>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late List<Animation<Offset>> slideAnimations;
  late List<Animation<double>> fadeAnimations;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slideAnimations = List.generate(
      4,
      (index) => Tween<Offset>(
        begin: const Offset(0, 1),
        end: const Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(index * 0.25, 1, curve: Curves.ease),
        ),
      ),
    );
    fadeAnimations = List.generate(
      4,
      (index) => Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(index * 0.25, 1),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return Flexible(
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: Dimensions.smallSize,
            crossAxisSpacing: Dimensions.midSize,
            childAspectRatio: 0.9,
          ),
          itemCount: appliances.length + 1,
          itemBuilder: (context, index) {
            if (index == appliances.length) {
              return SlideTransition(
                position: slideAnimations[index],
                child: FadeTransition(
                  opacity: fadeAnimations[index],
                  child: const AddApplianceCard(),
                ),
              );
            } else {
              return SlideTransition(
                position: slideAnimations[index],
                child: FadeTransition(
                  opacity: fadeAnimations[index],
                  child: ApplianceCard(appliance: appliances[index]),
                ),
              );
            }
          }),
    );
  }
}
