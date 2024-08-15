import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remote_home/screens/screens.dart';
import 'package:remote_home/utils/utils.dart';
import 'widgets.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Dami",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Always save on using Electricity",
              style: TextStyle(color: Colours.grey),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SettingsScreen(),
            ),
          ),
          child: const DPWidget(),
        )
      ],
    );
  }
}
