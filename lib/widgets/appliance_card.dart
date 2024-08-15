import 'package:flutter/material.dart';
import 'package:remote_home/screens/screens.dart';
import 'package:remote_home/utils/utils.dart';
import 'widgets.dart';

class ApplianceCard extends StatelessWidget {
  const ApplianceCard(
      {super.key,
      required this.title,
      required this.icon,
      required this.wattage,
      required this.duration,
      this.active = false});

  final String title, wattage, duration;
  final IconData icon;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ApplianceScreen(
            title: title,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilledIcon(
                  icon: icon,
                  iconColor: Colours.blue,
                ),
                ToggleButton(
                  state: active,
                )
              ],
            ),
            const SizedBox(height: Dimensions.smallSize),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              "Consuming $wattage",
              style: const TextStyle(color: Colours.grey),
            ),
            const SizedBox(height: Dimensions.smallSize),
            Text(
              duration,
              style: const TextStyle(color: Colours.blue, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
