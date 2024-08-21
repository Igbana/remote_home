import 'package:flutter/material.dart';

class DPWidget extends StatelessWidget {
  const DPWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        shape: CircleBorder(),
        color: Colors.red,
      ),
      width: 64,
      height: 64,
    );
  }
}