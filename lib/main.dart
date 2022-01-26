import 'package:academic_assistant/FirstScreen.dart';
import 'package:academic_assistant/Timetable1.dart';
import 'package:academic_assistant/alert.dart';
import 'package:academic_assistant/local_notification.dart';
import 'package:flutter/material.dart';
import './Allsems.dart';
import './ThirdScreen.dart';
import 'package:academic_assistant/todo_main.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home : MyApp(),
    )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.purple[800],
          title: Text('Academic Assistant'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: (){Navigator.of(context).push(new MaterialPageRoute(builder: (context) => LocalNotification()));},
            )
          ],
          bottom: TabBar(
            tabs: [

              Tab(text: "TT"),
              Tab(text: "Subject"),
              Tab(text: "CGPA"),

              Tab(text: "TODO"),
            ],
          ),
        ),
        //Tab(icon: Icon(Icons.camera_alt), text: "RA"),
        body: TabBarView(
          children: [
            Timetable1(),
            FirstScreen(),

            ThirdScreen(),

            TodoPage(),
          ],
        ),
      ),
    );

  }
}

