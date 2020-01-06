import 'package:fitness_app/Radial/radial_painter.dart';
import 'package:flutter/material.dart';

class Radial_Progress extends StatefulWidget {
  final double goalCompleted = .7;
  @override
  _Radial_ProgressState createState() => _Radial_ProgressState();
}

class _Radial_ProgressState extends State<Radial_Progress>
    with SingleTickerProviderStateMixin {
  AnimationController radialProgressanimation_controller;
  Animation<double> progress_animation;
  double progress_degree = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    radialProgressanimation_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    progress_animation = Tween(begin: 0.0, end: 360.0)
        .animate(CurvedAnimation(parent: radialProgressanimation_controller,curve: Curves.decelerate))
          ..addListener(() {
            setState(() {
              progress_degree =
                  widget.goalCompleted *progress_animation.value;
            });

          });
    radialProgressanimation_controller.forward();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    radialProgressanimation_controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        padding: EdgeInsets.only(top: 40),
        height: 200,
        width: 200,
        child: AnimatedOpacity(
          opacity: progress_degree>30 ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Column(
            children: <Widget>[
              Text(
                'Running',
                style: TextStyle(
                  fontSize: 24,
                  letterSpacing: 1.5

                ),

              ),
              SizedBox(
                height: 4,
              ),
              Container(
                height:5 ,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.all(Radius.circular(4))
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '1223.5',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                'Calories Burn',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    letterSpacing: 1.5
                ),
              )

            ],
          ),

        ),
      ),
      painter: RadialPainter(radial_progress_paint: progress_degree),
    );
  }
}
