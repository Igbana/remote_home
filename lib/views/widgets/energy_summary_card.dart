import 'package:flutter/material.dart';
import 'package:remote_home/utils/utils.dart';

import 'widgets.dart';

class EnergySummaryCard extends StatelessWidget {
  const EnergySummaryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.midSize,
        horizontal: Dimensions.smallSize,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.smallSize),
        color: Colors.white,
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Energy Usage",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              CalendarButton(),
            ],
          ),
          SizedBox(height: Dimensions.midSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TodayEnergy(),
              MonthEnergy(),
            ],
          ),
        ],
      ),
    );
  }
}
