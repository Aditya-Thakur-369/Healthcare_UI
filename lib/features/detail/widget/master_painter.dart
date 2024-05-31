// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MasterPainter extends CustomPainter {
  Color color;
  MasterPainter({
    required this.color,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.strokeWidth = 2;
    paint.color = color;
    paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 92);

    canvas.drawCircle(
        Offset(size.width / 2 - 20, size.height / 2 - 20), 130, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
