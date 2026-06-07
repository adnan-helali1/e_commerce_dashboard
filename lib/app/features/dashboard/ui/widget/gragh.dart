import 'package:flutter/material.dart';

class Gragh extends StatelessWidget {
  const Gragh({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:250,
      width: 400,
      child: CustomPaint(
        painter: CurveChartPainter(),
      ),
    );
  }
}

class CurveChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final points = [
      Offset(0, size.height * .7),
      Offset(size.width * .2, size.height * .45),
      Offset(size.width * .4, size.height * .5),
      Offset(size.width * .6, size.height * .2),
      Offset(size.width * .8, size.height * .35),
      Offset(size.width, size.height * .75),
    ];

    final path = Path();
    path.moveTo(points.first.dx, points.first.dy);

    for (int i = 0; i < points.length - 1; i++) {
      final p1 = points[i];
      final p2 = points[i + 1];

      final controlX = (p1.dx + p2.dx) / 2;

      path.cubicTo(
        controlX,
        p1.dy,
        controlX,
        p2.dy,
        p2.dx,
        p2.dy,
      );
    }
    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.blue.withOpacity(.15)
        ..strokeWidth = 10
        ..style = PaintingStyle.stroke
        ..maskFilter = const MaskFilter.blur(
          BlurStyle.normal,
          8,
        ),
    );
    canvas.drawPath(
      path,
      Paint()
        ..shader = const LinearGradient(
          colors: [
            Color(0xff2563EB),
            Color(0xff06B6D4),
          ],
        ).createShader(
          Rect.fromLTWH(0, 0, size.width, size.height),
        )
        ..strokeWidth = 4
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );
    final fillPath = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(
      fillPath,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.grey.withOpacity(.10),
            Colors.transparent,
          ],
        ).createShader(
          Rect.fromLTWH(0, 0, size.width, size.height),
        ),
    );
    for (final point in points) {
      canvas.drawCircle(
        point,
        6,
        Paint()..color = Colors.white,
      );

      canvas.drawCircle(
        point,
        4,
        Paint()..color = const Color(0xff2563EB),
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) =>true;
}