import 'package:fitness_app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarPainter extends CustomPainter{
  final percentage_bar_painter;
  BarPainter({this.percentage_bar_painter});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
    ..color = grey_Color
    ..strokeCap= StrokeCap.round
    ..strokeWidth = 5.0;

    Offset topPoint = Offset(0,0);
    Offset middlePoint = Offset(0,(size.height+ 20 )/2); //we have added 20 to make sure no bar will cover grey bar
    Offset bottomPoint = Offset(0,size.height+ 20);

    canvas.drawLine(topPoint, bottomPoint, paint);

    Paint filled_paint = Paint()
    ..shader= LinearGradient(colors: [Colors.pink.shade500, Colors.blue.shade500], begin: Alignment.topCenter).createShader(Rect.fromPoints(topPoint, bottomPoint))
    ..strokeCap= StrokeCap.round
    ..strokeWidth = 5;
    
    double bar_height = percentage_bar_painter*size.height;
    double half_bar_height = bar_height/2;
    
    canvas.drawLine(middlePoint, Offset(0,middlePoint.dy-half_bar_height), filled_paint);
    canvas.drawLine(middlePoint, Offset(0,middlePoint.dy + half_bar_height), filled_paint);




  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate !=this;
  }

}