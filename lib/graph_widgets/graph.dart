import 'package:fitness_app/data.dart';
import 'package:flutter/material.dart';
import 'bar_painter.dart';

class Graph extends StatelessWidget {
  final animationContoller;
  final height1;
  final values;
  Graph({this.animationContoller,this.height1=120.0,this.values}); // height variable become double type so when we give .....

  @override
  Widget build(BuildContext context) {
  
    return Container(
      padding: EdgeInsets.only(left: 20,right: 20),
      height: height1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: build_Bars(values)
//        <Widget>[
//          
//          GraphBar(height2: height1,percentage_bar: .5,),
//          GraphBar(height2: height1,percentage_bar: .8,),
//          GraphBar(height2: height1,percentage_bar: .3,),
//          GraphBar(height2: height1,percentage_bar: .7,),
//          GraphBar(height2: height1,percentage_bar: .9,),
//
//
//        ],
      ),
    );
  }
  build_Bars(List<GraphData> values){
    List<GraphBar> _bars = List();

    GraphData maxGraph_data = values.reduce((current, next){
      return next.compareTo(current)>=1?next:current;
    });
    values.forEach((graph_data){
      double percentage;
      percentage = graph_data.value/maxGraph_data.value;
      _bars.add(GraphBar(height2: height1,percentage_bar : percentage ,graph_bar_animation_controller: animationContoller,));

    });

    return _bars;

  }

}


class GraphBar extends StatefulWidget {
  final height2;
  final percentage_bar;
  final graph_bar_animation_controller;
  GraphBar({this.height2,this.percentage_bar,this.graph_bar_animation_controller});
  @override
  _GraphBarState createState() => _GraphBarState();
}

class _GraphBarState extends State<GraphBar> {
  Animation<double> percentage_Animation;

  @override
  void initState() {
    // TODO: implement initState
    percentage_Animation = Tween<double>(begin: 0,end: widget.percentage_bar).animate(widget.graph_bar_animation_controller);
    percentage_Animation.addListener((){
      setState(() {

      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BarPainter( percentage_bar_painter: percentage_Animation.value),
      child: Container(
        height: widget.height2,
      ),
    );
  }
}

