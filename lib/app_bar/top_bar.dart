import 'package:flutter/material.dart';
import 'curves_painter.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CurvesPainter(),
      child: Container(
        height: 250,
      ),


    );
  }
}

