// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:healthcare/common/color/app_color.dart';

class HomePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.strokeWidth = 2;
    paint.color = AppColors.blueColor.withOpacity(0.6);
    paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 92);

    canvas.drawCircle(Offset(size.width - 60, 30), 150, paint);

    Paint paint1 = Paint();
    paint1.strokeWidth = 2;
    paint1.color = AppColors.blueColor.withOpacity(0.6);
    paint1.maskFilter = const MaskFilter.blur(BlurStyle.normal, 92);

    canvas.drawCircle(Offset(10, size.height / 2 - 50), 150, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
