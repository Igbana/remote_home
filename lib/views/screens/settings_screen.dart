import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remote_home/utils/utils.dart';
import '../widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Settings",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          leading: GestureDetector(
            child: const Icon(CupertinoIcons.chevron_back),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(18.0),
          children: const [
            ListItem(
              icon: CupertinoIcons.timer,
              title: "Schedule Bedtime",
            ),
            SizedBox(height: Dimensions.smallSize),
            ListItem(
              icon: CupertinoIcons.profile_circled,
              title: "Logout",
              type: ListItemType.danger,
            )
          ],
        ));
  }
}
