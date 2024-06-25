import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            color: Colors.white,
            child: CustomPaint(
              size: Size(
                double.infinity,
                 600),
                 
              painter: MyPainter(),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final qalam = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    canvas.drawCircle(center, radius, );

    final soat = Paint()
      ..color = Colors.blue[900]!
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius - 5, soat);

    final nimadur = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    nimadur.color = Colors.blue;
    canvas.drawLine(center, Offset(center.dx, center.dy - radius / 2), handPaint);

    nimadur.color = Colors.pink;
    canvas.drawLine(center, Offset(center.dx + radius / 3, center.dy), handPaint);

    nimadur.color = Colors.yellow;
    canvas.drawLine(center, Offset(center.dx, center.dy + radius / 3), handPaint);

    final centerCirclePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 10, centerCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
