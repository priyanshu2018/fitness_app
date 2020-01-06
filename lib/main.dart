import 'package:fitness_app/bloc_logics/bloc.dart';
import 'package:fitness_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/theme/colors.dart';
import 'app_bar/top_bar.dart';
import 'theme/utils_date.dart';
import 'Radial/radial_progress.dart';
import 'graph_widgets/show_graph.dart';
void main() => runApp(MyApp());//MyApp()

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      theme:apptheme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  MyHomePageBloc home_page_bloc;
  AnimationController  iconAnimationController;



  @override
  void initState() {
    home_page_bloc = MyHomePageBloc();
    iconAnimationController = AnimationController(vsync: this,duration: Duration(milliseconds: 380));
    // TODO: implement initState
    super.initState();
  }

 @override
  void dispose() {
   home_page_bloc.dispose();
   iconAnimationController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  TopBar(),
                  Positioned(
                    top: 60,
                    right: 0,
                    left: 0,

                    child: Row(


                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios,
                            size: 35,
                            color: Colors.white,),
                          onPressed: (){


                            home_page_bloc.subtractDate();

                          },
                        ),
                        StreamBuilder(
                          stream: home_page_bloc.dateStream,
                          initialData: home_page_bloc.selected_date,
                          builder: (context,snapshot){
                            return Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    formatter_day_of_week.format(snapshot.data),
                                    style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    formatter_date.format(snapshot.data),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                            );
                          },

                        ),
                        IconButton(

                          icon: Icon(Icons.arrow_forward_ios,
                            size: 35,
                            color: Colors.white,),
                          onPressed: (){


                            home_page_bloc.addDate();

                          },

                        )
                      ],

                    ),
                  )
                ],
              ),
              Radial_Progress(),

            ],

          ),
          Positioned(
            bottom: 50,
              left: 0,
              right: 0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.red
                ),
                shape: BoxShape.circle
              ),
              child: IconButton(
                color: Colors.red,
                icon: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  progress: iconAnimationController.view,
                ),
                onPressed: (){
                  setState(() {
                    icon_pressed();
                  });
                },
              ),
            ),
          ),
          ShowGraph()

        ],

      ),
    );

  }

  void icon_pressed() {
    animationStatus ? iconAnimationController.reverse():iconAnimationController.forward();
    display_bar = !display_bar;
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => ShowGraph()));

  }
  bool get animationStatus{
    final AnimationStatus status = iconAnimationController.status;
    return status == AnimationStatus.completed;
  }
}
