import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remote_home/utils/utils.dart';

class TodayEnergy extends StatelessWidget {
  const TodayEnergy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.power, color: Colours.blue),
        SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Today",
              style: TextStyle(
                color: Colours.grey,
              ),
            ),
            Text(
              "29.5kWh",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
