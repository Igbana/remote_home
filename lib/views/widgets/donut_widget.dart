import 'dart:math';
import 'package:flutter/material.dart';
import 'package:remote_home/models/models.dart';
import 'package:remote_home/utils/dimensions.dart';

class DonutWidget extends StatefulWidget {
  const DonutWidget({super.key, required this.data});
  final List<ChartData> data;

  @override
  State<DonutWidget> createState() => _DonutWidgetState();
}

class _DonutWidgetState extends State<DonutWidget> {
  List<double> finalY = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RotatedBox(
          quarterTurns: -1,
          child: CustomPaint(
            painter: DonutPainter(
              data: widget.data,
            ),
            size: const Size(140, 140),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (ChartData item in widget.data)
              Row(
                children: [
                  Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                        color: item.color,
                        borderRadius: BorderRadius.circular(2)),
                  ),
                  const SizedBox(
                    width: Dimensions.smallSize,
                  ),
                  Text(item.x)
                ],
              )
          ],
        )
      ],
    );
  }
}

class DonutPainter extends CustomPainter {
  DonutPainter({required this.data});
  List<ChartData> data;

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 16;
    double startAngle = 0;
    double padding = (20 * pi / 180);
    double sum = 0;
    for (ChartData item in data) {
      sum += item.y;
    }
    for (ChartData item in data) {
      startAngle += data.indexOf(item) == 0
          ? 0
          : (2 * pi) * ((data[data.indexOf(item) - 1].y) / sum);
      canvas.drawArc(
        Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: size.width - strokeWidth,
            height: size.height - strokeWidth),
        startAngle + padding,
        (2 * pi) * (data[data.indexOf(item)].y / sum) - padding,
        // data[data.indexOf(item) - 1].y - padding,
        false,
        Paint()
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..color = item.color,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
