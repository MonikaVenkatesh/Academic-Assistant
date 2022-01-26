
import 'package:flutter/material.dart';
import 'dart:async';
import './CGPAPage.dart';
import 'package:shared_preferences/shared_preferences.dart';



class HomePage extends StatefulWidget{
  final double score;
  HomePage(this.score);
  @override
  HomePageState createState() => new HomePageState(score);
}
class HomePageState extends State<HomePage>{
  SharedPreferences prefs;
  TextEditingController semController = new TextEditingController();
  int n;
  final double score;
  HomePageState(this.score);
  double cgpa;
  initState() {
    super.initState();
    init();
  }

  void init() async{
    prefs = await SharedPreferences.getInstance();
    prefs.commit();
    cgpa = (prefs.getDouble('cgpa') ?? 0);
    setState(() {
      cgpa;
    });

  }
  void set()
  {
    setState(() {
      cgpa=score;
    });
    prefs.setDouble('cgpa', cgpa);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:Text("CGPA calculator"), backgroundColor: Colors.purple[800]),
      backgroundColor: Colors.white,
      body:Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.transparent,width: 25.0),color: Colors.transparent),
        child: ListView(
          children: <Widget>[
            TextField(
              textAlign: TextAlign.center,
              autofocus: true,
              /*decoration:  InputDecoration(
                  fillColor: Colors.purple[800],
                  hintText: "Enter number of semester",
                  hintStyle: TextStyle(color: Colors.black54)
              ),*/
              decoration: InputDecoration(hintText: 'Enter number of semesters',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.purple[800],
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.purple[100],
                    width: 2.0,
                  ),
                ),),
              keyboardType: TextInputType.number,
              controller: semController,
              onChanged: (String str){
                setState((){
                  if(semController.text=="")
                  {n=0;}
                  else{
                    n=int.parse(semController.text);
                  }
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.touch_app,size: 35.0,color: Colors.purple[800],),
              onPressed: (){
                if(n is int && n > 0 ){
                  int pass=n;
                  n=0;
                  semController.text="";
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder:(BuildContext context)=> cgpaCalc(pass)));
                }
                else{
                  semController.text="";
                  alert();
                }
              },
            ),
            new Padding(
                padding: EdgeInsets.all(20)
            ),
            //new FlatButton(onPressed: (){set();}, child: new Text('Refresh GPA')),
            new ElevatedButton(
                child: new Text("Refresh GPA"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple[800],
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    textStyle: TextStyle(
                      fontSize: 17,
                    )
                ),
                onPressed: (){set();}
            ),
            new Padding(
                padding: EdgeInsets.all(20)
            ),
            new Container(
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text("Your CGPA is: "+cgpa.toStringAsFixed(cgpa.truncateToDouble() == cgpa ? 0 : 3),style: new TextStyle(color: Colors.purple[800],fontWeight: FontWeight.bold,fontSize: 25.0)),
                    new Text(cgpa.toStringAsFixed(cgpa.truncateToDouble() == cgpa ? 0 : 3),style: new TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 50.0)),
                  ]
              ),
            )
          ],
        ),
      ),
    );
  }
  alert()  {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text('Please enter number of semester to calculate CGPA'),

          actions: <Widget>[
            FlatButton(
              child:  Icon(Icons.clear,size: 40.0,),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}