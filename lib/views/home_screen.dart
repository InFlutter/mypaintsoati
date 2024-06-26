import 'package:flutter/material.dart';
import 'dart:math';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
      body: Center(
        child: Container(
          color: Colors.white,
          child: CustomPaint(
            size: const Size(double.infinity, 700),
            painter: MyPainter(DateTime.now()),
          ),
        ),
      ),
    );
  }
}


class MyPainter extends CustomPainter {
  final DateTime dateTime;

  MyPainter(this.dateTime);

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = min(centerX, centerY);

    // Border
    final paintBorder = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawCircle(Offset(centerX, centerY), radius, paintBorder);

    // Body
    final paintBody = Paint()
      ..color = Colors.blue.shade200
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(centerX, centerY), radius, paintBody);

    // Center Circle
    final paintCenterCircle = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(centerX, centerY), 15, paintCenterCircle);

    // Draw hour numbers
    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    for (int i = 1; i <= 12; i++) {
      double angle = (i * 30 - 90) * pi / 180;
      double x = centerX + (radius - 30) * cos(angle);
      double y = centerY + (radius - 30) * sin(angle);

      textPainter.text = TextSpan(
        text: i.toString(),
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),
      );

      textPainter.layout();
      textPainter.paint(canvas, Offset(x - textPainter.width / 2, y - textPainter.height / 2));
    }

    // Draw minute markers
    for (int i = 0; i < 60; i++) {
      double angle = (i * 6 - 90) * pi / 180;
      double outerX = centerX + (radius - 10) * cos(angle);
      double outerY = centerY + (radius - 10) * sin(angle);
      double innerX = centerX + (radius - 20) * cos(angle);
      double innerY = centerY + (radius - 20) * sin(angle);

      final paintMarker = Paint()
        ..color = Colors.black
        ..strokeWidth = i % 5 == 0 ? 4 : 2;

      canvas.drawLine(Offset(innerX, innerY), Offset(outerX, outerY), paintMarker);
    }

    // Seconds Hand
    final paintSeconds = Paint()
      ..color = Colors.yellow.shade900
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    double secondRadians = (dateTime.second * 6 - 90) * pi / 180;
    double secondX = centerX + radius * 0.8 * cos(secondRadians);
    double secondY = centerY + radius * 0.8 * sin(secondRadians);

    final pathSeconds = Path()
      ..moveTo(centerX, centerY)
      ..lineTo(secondX, secondY);

    canvas.drawPath(pathSeconds, paintSeconds);

    // Minutes Hand
    final paintMinutes = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    double minuteRadians = (dateTime.minute * 6 - 90) * pi / 180;
    double minuteX = centerX + radius * 0.7 * cos(minuteRadians);
    double minuteY = centerY + radius * 0.7 * sin(minuteRadians);

    final pathMinutes = Path()
      ..moveTo(centerX, centerY)
      ..lineTo(minuteX, minuteY);

    canvas.drawPath(pathMinutes, paintMinutes);

    // Hours Hand
    final paintHours = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    double hourRadians = ((dateTime.hour % 12) * 30 + dateTime.minute * 0.5 - 90) * pi / 180;
    double hourX = centerX + radius * 0.5 * cos(hourRadians);
    double hourY = centerY + radius * 0.5 * sin(hourRadians);

    final pathHours = Path()
      ..moveTo(centerX, centerY)
      ..lineTo(hourX, hourY);

    canvas.drawPath(pathHours, paintHours);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}