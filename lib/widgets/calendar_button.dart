import 'package:flutter/material.dart';
import 'package:remote_home/utils/utils.dart';

class CalendarButton extends StatefulWidget {
  const CalendarButton({
    super.key,
  });

  @override
  State<CalendarButton> createState() => _CalendarButtonState();
}

class _CalendarButtonState extends State<CalendarButton> {
  String date =
      "${DateTime.now().day} ${months[DateTime.now().month - 1]} ${DateTime.now().year}";
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDatePicker(
          context: context,
          firstDate: DateTime.now().subtract(const Duration(days: 60)),
          lastDate: DateTime.now(),
        ).then((value) {
          setState(() {
            date = "${value!.day} ${months[value.month - 1]} ${value.year}";
          });
        });
      },
      child: Row(
        children: [
          const Icon(
            Icons.calendar_month,
            color: Colours.blue,
          ),
          const SizedBox(width: 4),
          Text(
            date,
            style: const TextStyle(color: Colours.grey),
          ),
          const Icon(Icons.keyboard_arrow_down, color: Colours.grey)
        ],
      ),
    );
  }
}
