import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remote_home/utils/utils.dart';

import 'widgets.dart';

class AddApplianceCard extends StatelessWidget {
  const AddApplianceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return const CupertinoAlertDialog(
              title: Text("Remote home"),
              content: Text(
                "This functionality is not available yet. It will be implemented in later versions of the application",
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(36),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledIcon(
              icon: Icons.add,
              iconColor: Colours.blue,
            ),
            SizedBox(height: Dimensions.smallSize),
            Text(
              "Add appliance",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colours.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
