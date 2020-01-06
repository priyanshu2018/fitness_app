import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class RadialPainter extends CustomPainter{
  double radial_progress_paint;
  RadialPainter({this.radial_progress_paint});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
    ..color = Colors.black12
      ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10;

    Offset center = Offset(size.width/2,size.height/2);
    canvas.drawCircle(center, size.width/2, paint);


      Paint progress_paint = Paint()

       ..shader = LinearGradient(colors: [
         Colors.red,Colors.purple,
         Colors.purpleAccent
       ]).createShader( Rect.fromCircle(center: center,radius: size.width/2))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
      canvas.drawArc(Rect.fromCircle(center: center, radius: size.width/2), math.radians(-90), math.radians(radial_progress_paint), false , progress_paint);
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate !=this;
  }

}