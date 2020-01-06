import 'package:fitness_app/theme/colors.dart';
import 'package:flutter/material.dart';



class CurvesPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    Path path = Path();
    path.lineTo(0, size.height*.75);
    path.quadraticBezierTo(size.width*.10, size.height*.70, size.width*.17, size.height*.90);
    path.quadraticBezierTo(size.width*.20, size.height, size.width*.25, size.height*.90);
    path.quadraticBezierTo(size.width*.40, size.height*.4, size.width*.50, size.height*.70);
    path.quadraticBezierTo(size.width*.60, size.height*.85, size.width*.65, size.height*.65);
    path.quadraticBezierTo(size.width*.70, size.height*.90, size.width, 0);

    path.close();
    paint.color = thirdColor;
    canvas.drawPath(path,paint);

     path = Path();
    path.lineTo(0, size.height*.5);
    path.quadraticBezierTo(size.width*.10, size.height*.90, size.width*.15, size.height*.60);
    path.quadraticBezierTo(size.width*.20, size.height*.45, size.width*.27, size.height*.60);
    path.quadraticBezierTo(size.width*.45, size.height, size.width*.50, size.height*.80);
    path.quadraticBezierTo(size.width*.55, size.height*.45, size.width*.75, size.height*.75);
    path.quadraticBezierTo(size.width*.85, size.height*.93, size.width, size.height*0.6);
    path.lineTo(size.width, 0);

    path.close();
    paint.color = secondColor;
    canvas.drawPath(path,paint);



     path = Path();
    path.lineTo(0, size.height*.75);
    path.quadraticBezierTo(size.width*.10, size.height*.55, size.width*.20, size.height*.70);
    path.quadraticBezierTo(size.width*.30, size.height*.90, size.width*.40, size.height*.75);
    path.quadraticBezierTo(size.width*.52, size.height*.50, size.width*.65, size.height*.70);
    path.quadraticBezierTo(size.width*.75, size.height*.85, size.width, size.height*.6);
    path.lineTo(size.width, 0);

    path.close();
    paint.color = firstColor;
    canvas.drawPath(path,paint);




  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {

    return oldDelegate !=this;
  }

}