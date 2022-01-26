import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:academic_assistant/HomePage.dart';
import 'package:academic_assistant/gpapage.dart';
import 'package:academic_assistant/gpapage2.dart';
import 'package:academic_assistant/gpapage3.dart';
import 'package:academic_assistant/gpapage4.dart';
import 'package:academic_assistant/gpapage5.dart';
import 'package:academic_assistant/gpapage6.dart';
import 'package:academic_assistant/gpapage7.dart';
import 'package:academic_assistant/gpapage8.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(new MaterialApp(
    home: new GPA(0),)
  );
}



class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title:Text("CGPA calculator"), backgroundColor: Colors.purple[800]),

      backgroundColor: Colors.purple[800],
      body : SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.zero,
                  child: Center(
                      child: Column(
                        children: <Widget>[

                          new Padding(padding: EdgeInsets.all(10)),
                          new ElevatedButton(
                              child: new Text("Semester 1",
                                style: TextStyle(
                                    color: Colors.purple[800]
                                ),),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                                  textStyle: TextStyle(
                                    fontSize: 17,
                                  )
                              ),
                              onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => GPA(0),),);}
                          ),
                          new Padding(padding: EdgeInsets.all(5)),
                          new ElevatedButton(
                              child: new Text("Semester 2",
                                style: TextStyle(
                                    color: Colors.purple[800]
                                ),),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                                  textStyle: TextStyle(
                                    fontSize: 17,
                                  )
                              ),
                              onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => GPA2(0),),);}
                          ),
                          new Padding(padding: EdgeInsets.all(5)),
                          new ElevatedButton(
                              child: new Text("Semester 3",
                                style: TextStyle(
                                    color: Colors.purple[800]
                                ),),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                                  textStyle: TextStyle(
                                    fontSize: 17,
                                  )
                              ),
                              onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => GPA3(0),),);}
                          ),
                          new Padding(padding: EdgeInsets.all(5)),
                          new ElevatedButton(
                              child: new Text("Semester 4",
                                style: TextStyle(
                                    color: Colors.purple[800]
                                ),),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                                  textStyle: TextStyle(
                                    fontSize: 17,
                                  )
                              ),
                              onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => GPA4(0),),);}
                          ),
                          new Padding(padding: EdgeInsets.all(5)),
                          new ElevatedButton(
                              child: new Text("Semester 5",
                                style: TextStyle(
                                    color: Colors.purple[800]
                                ),),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                                  textStyle: TextStyle(
                                    fontSize: 17,
                                  )
                              ),
                              onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => GPA5(0),),);}
                          ),
                          new Padding(padding: EdgeInsets.all(5)),
                          new ElevatedButton(
                              child: new Text("Semester 6",
                                style: TextStyle(
                                    color: Colors.purple[800]
                                ),),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                                  textStyle: TextStyle(
                                    fontSize: 17,
                                  )
                              ),
                              onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => GPA6(0),),);}
                          ),
                          new Padding(padding: EdgeInsets.all(5)),
                          new ElevatedButton(
                              child: new Text("Semester 7",
                                style: TextStyle(
                                    color: Colors.purple[800]
                                ),),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                                  textStyle: TextStyle(
                                    fontSize: 17,
                                  )
                              ),
                              onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => GPA7(0),),);}
                          ),
                          new Padding(padding: EdgeInsets.all(5)),
                          new ElevatedButton(
                              child: new Text("Semester 8",
                                style: TextStyle(
                                    color: Colors.purple[800]
                                ),),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                                  textStyle: TextStyle(
                                    fontSize: 17,
                                  )
                              ),
                              onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => GPA8(0),),);}
                          ),
                          new Padding(padding: EdgeInsets.all(8)),
                          new ElevatedButton(
                              child: new Text("CGPA",
                                style: TextStyle(
                                    color: Colors.purple[800]
                                ),),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                                  textStyle: TextStyle(
                                    fontSize: 17,
                                  )
                              ),
                              onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage(0),),);}
                          ),
                        ],
                      )
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
