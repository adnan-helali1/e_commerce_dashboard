 import 'dart:math';
import 'package:flutter/material.dart';

class Circule {
  final String title;
  final double value;
  final Color color;
  final List<Color> colors;

  const Circule({
    required this.title,
    required this.value,
    required this.color,
    required this.colors,
  });
}

class PieChartScreen extends StatelessWidget {
  const PieChartScreen({super.key});

  final List<Circule> data = const [
    Circule(
      title: "Dairy (85)",
      value: 85,
      color: Colors.blue,
      colors: [Colors.blue, Colors.lightBlueAccent],
    ),
    Circule(
      title: "Beverages (42)",
      value: 42,
      color: Colors.cyan,
      colors: [Colors.cyan, Colors.cyanAccent],
    ),
    Circule(
      title: "Meat (38)",
      value: 38,
      color: Colors.red,
      colors: [Colors.red, Colors.redAccent],
    ),
    Circule(
      title: "Vegetables (53)",
      value: 53,
      color: Colors.indigo,
      colors: [Colors.indigo, Colors.indigoAccent],
    ),
    Circule(
      title: "Fruits (48)",
      value: 48,
      color: Colors.orange,
      colors: [Colors.orange, Colors.orangeAccent],
    ),
    Circule(
      title: "Bakery (62)",
      value: 62,
      color: Colors.green,
      colors: [Colors.green, Colors.lightGreenAccent],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final total = data.fold<double>(
      0,
      (sum, item) => sum + item.value,
    );

    double startAngle = -90;

    return Center(
      child: SizedBox(
        width: 500,
        height: 450,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: const Size(280, 280),
              painter: PieChartPainter(data),
            ),

            // Labels Around Chart
            ...data.map((item) {
              final sweepAngle =
                  (item.value / total) * 360;

              final middleAngle =
                  startAngle + sweepAngle / 2;

              final radians =
                  middleAngle * pi / 180;

              const labelRadius = 190.0;

              final x =
                  cos(radians) * labelRadius;

              final y =
                  sin(radians) * labelRadius;

              startAngle += sweepAngle;

              return Positioned(
                left: 250 + x - 60,
                top: 225 + y - 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: Text(
                    item.title,
                    style: TextStyle(
                      color: item.color,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class PieChartPainter extends CustomPainter {
  final List<Circule> data;

  PieChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final total = data.fold<double>(
      0,
      (sum, item) => sum + item.value,
    );

    final center =
        Offset(size.width / 2, size.height / 2);

    final radius =
        min(size.width, size.height) / 2;

    double startAngle = -pi / 2;

    for (final item in data) {
      final sweepAngle =
          (item.value / total) * 2 * pi;

      final rect = Rect.fromCircle(
        center: center,
        radius: radius,
      );
       final paint = Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: item.colors,
        ).createShader(rect);

      canvas.drawArc(
        rect,
        startAngle,
        sweepAngle,
        true,
        paint,
      );

      // فاصل أبيض بين القطاعات
      canvas.drawArc(
        rect,
        startAngle,
        sweepAngle,
        true,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = Colors.white,
      );

      startAngle += sweepAngle;
    }

    // Donut Hole
    canvas.drawCircle(
      center,
      radius * 0.55,
      Paint()..color = Colors.white,
    );

    // Text in Center
    final textPainter = TextPainter(
      text: const TextSpan(
        text: "328",
        style: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    textPainter.paint(
      canvas,
      Offset(
        center.dx - textPainter.width / 2,
        center.dy - textPainter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(
      covariant CustomPainter oldDelegate) {
    return true;
  }
}