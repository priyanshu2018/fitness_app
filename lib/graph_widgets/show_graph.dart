import 'package:fitness_app/constants.dart';
import 'package:fitness_app/graph_widgets/graph.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/data.dart';

class ShowGraph extends StatefulWidget {
  @override
  _ShowGraphState createState() => _ShowGraphState();
}

class _ShowGraphState extends State<ShowGraph>  with SingleTickerProviderStateMixin<ShowGraph>{
  AnimationController _graphAnimation_Controller;
  @override
  void initState() {
    _graphAnimation_Controller = AnimationController(vsync: this,duration: Duration(seconds: 2));

    super.initState();
  }
  @override
  void dispose() {
    _graphAnimation_Controller.dispose();
    super.dispose();
  }

  void Check_Bar_Animation(){
    if(display_bar)
      _graphAnimation_Controller.forward();
    else
      _graphAnimation_Controller.reset();



  }

  @override
  Widget build(BuildContext context) {
    Check_Bar_Animation();

    Size size = MediaQuery.of(context).size;
    double screen_width = size.width;
    double screen_height = size.height;

    return  AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          top: display_bar? 150 : screen_height * 1,
          bottom:display_bar ? 150 : screen_width * -0.0,
          left: display_bar ? 40 : screen_width * 0.5,
          right: display_bar ? 40 : screen_width * 0.5,

          child: Material(
            color: Colors.white.withOpacity(.92),
            elevation: 10,
            child: Container(
              alignment: Alignment.center,
              child: InkWell(
                onTap: (){

                },
                child: Graph(animationContoller: _graphAnimation_Controller,values: dayDate ,),

              ),
            ),
          ),
        );

  }
}
