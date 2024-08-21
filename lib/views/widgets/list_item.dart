import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remote_home/utils/utils.dart';

class ListItem extends StatelessWidget {
  const ListItem(
      {super.key,
      required this.icon,
      required this.title,
      this.type = ListItemType.normal});

  final IconData icon;
  final String title;
  final ListItemType type;

  @override
  Widget build(BuildContext context) {
    Color? color = switch (type) {
      ListItemType.normal => null,
      ListItemType.danger => Colors.red,
      ListItemType.warning => Colors.yellow,
      ListItemType.success => Colors.green,
    };
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[100],
      ),
      child: CupertinoListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: color,
            fontWeight: type == ListItemType.normal ? null : FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
