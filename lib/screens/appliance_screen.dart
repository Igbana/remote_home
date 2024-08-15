import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remote_home/widgets/widgets.dart';

class ApplianceScreen extends StatelessWidget {
  const ApplianceScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w400),
        ),
        leading: GestureDetector(
          child: const Icon(CupertinoIcons.chevron_back),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: ToggleButton(),
          )
        ],
      ),
      body: const Center(
        child: Text(
          "Appliance screen",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
