import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:remote_home/models/models.dart';
import 'package:remote_home/utils/dimensions.dart';
import '../widgets/widgets.dart';

class ApplianceScreen extends StatefulWidget {
  const ApplianceScreen({super.key, required this.appliance});

  final Appliance appliance;

  @override
  State<ApplianceScreen> createState() => _ApplianceScreenState();
}

class _ApplianceScreenState extends State<ApplianceScreen> {
  bool scheduled = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text(
          widget.appliance.name,
          style: const TextStyle(fontWeight: FontWeight.w400),
        ),
        leading: GestureDetector(
          child: const Icon(CupertinoIcons.chevron_back),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ToggleButton(
              state: widget.appliance.isOn,
              onChanged: (state) {
                widget.appliance.toggle(state);
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 20.0,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: widget.appliance.image,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "${widget.appliance.wattage}kWh",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Schedule power",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      ToggleButton(onChanged: (state) {
                        setState(() {
                          scheduled = !scheduled;
                        });
                      }),
                    ],
                  ),
                  if (scheduled)
                    Column(
                      children: [
                        const SizedBox(height: Dimensions.midSize),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Power on",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                            TimeButton(
                              initialTime: widget.appliance.scheduleTime == null
                                  ? const TimeOfDay(hour: 6, minute: 0)
                                  : widget.appliance.scheduleTime!.powerOn,
                              onChanged: (time) {},
                            ),
                          ],
                        ),
                        const SizedBox(height: Dimensions.smallSize),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Power off",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                            TimeButton(
                              initialTime: widget.appliance.scheduleTime == null
                                  ? const TimeOfDay(hour: 18, minute: 0)
                                  : widget.appliance.scheduleTime!.powerOff,
                              onChanged: (time) {},
                            ),
                          ],
                        ),
                      ],
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TimeButton extends StatefulWidget {
  const TimeButton({
    super.key,
    required this.initialTime,
    required this.onChanged,
  });

  final TimeOfDay initialTime;
  final Function(TimeOfDay time) onChanged;

  @override
  State<TimeButton> createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  TimeOfDay? displayTime;
  @override
  void initState() {
    displayTime = widget.initialTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showTimePicker(
          context: context,
          initialTime: displayTime!,
        ).then((val) {
          setState(() {
            displayTime = val ?? displayTime;
            widget.onChanged(val ?? widget.initialTime);
          });
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
        child: Text(
            "${(displayTime!.hour % 12) < 10 ? "0${displayTime!.hour % 12}" : displayTime!.hour % 12}: ${displayTime!.minute < 10 ? "0${displayTime!.minute}" : displayTime!.minute}${displayTime!.hour > 12 ? "pm" : "am"}"),
      ),
    );
  }
}
