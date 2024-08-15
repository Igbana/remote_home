import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({
    super.key,
    this.state = false,
  });

  final bool state;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool state = false;
  @override
  void initState() {
    state = widget.state;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: CupertinoSwitch(
          activeColor: Colors.blue,
          value: state,
          onChanged: (val) {
            setState(() {
              state = !state;
            });
          }),
    );
  }
}
