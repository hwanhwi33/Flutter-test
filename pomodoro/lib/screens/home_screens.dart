import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int twentyFiveSeconds= 1500;
  int totalSeconds= 10;
  bool isRunning= false;
  int totalPomodoros=0;
  late Timer timer;

  void onTick(Timer timer){
    if(totalSeconds==0){
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
        totalSeconds = twentyFiveSeconds;
        timer.cancel();
      });
    }
    else{
        setState(() {
        totalSeconds = totalSeconds -1;
      });
    }
  }

  void onStartPressed(){
    timer = Timer.periodic(Duration(seconds: 1), onTick);

    setState(() {
      isRunning=true;
    });
  }

  void onPausePressed(){
    timer.cancel();
    setState(() {
      isRunning=false;
    });
  }

  String format(int seconds){
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2,7);
  }

  void onRestartPressed(){
    setState(() {
      isRunning=false;
      totalSeconds = twentyFiveSeconds;
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
           Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 120,
                  color: Theme.of(context).cardColor,
                onPressed: isRunning? onPausePressed: onStartPressed, 
                icon: Icon(
                  isRunning? Icons.pause_circle_outline_outlined :
                  Icons.play_circle_outlined,
                  ),
                ),
                IconButton(
                  iconSize: 30,
                  color: Theme.of(context).cardColor,
                  onPressed: onRestartPressed, 
                  icon: Icon(Icons.restart_alt_outlined)
                  ),
              ],
            ),
          ),
           Flexible(
            flex:1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headlineLarge!.color,
                          ),
                          ),
                        Text(
                          '$totalPomodoros',
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headlineLarge!.color,
                          ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}