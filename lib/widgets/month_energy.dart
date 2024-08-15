import 'package:flutter/cupertino.dart';
import 'package:remote_home/utils/utils.dart';

class MonthEnergy extends StatelessWidget {
  const MonthEnergy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.bolt_fill,
            color: Colours.yellow,
          ),
          const SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "This month",
                style: TextStyle(color: Colours.grey),
              ),
              Text(
                "349.87kWh",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
