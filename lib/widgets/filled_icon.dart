import 'package:flutter/material.dart';

class FilledIcon extends StatefulWidget {
  const FilledIcon({
    super.key,
    required this.icon,
    this.iconColor,
    this.backgroundColor,
  });

  final IconData icon;
  final Color? iconColor, backgroundColor;

  @override
  State<FilledIcon> createState() => _FilledIconState();
}

class _FilledIconState extends State<FilledIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        shape: const CircleBorder(),
        color:
            widget.backgroundColor ?? const Color.fromARGB(151, 235, 245, 254),
      ),
      child: Icon(
        widget.icon,
        color: widget.iconColor,
      ),
    );
  }
}
