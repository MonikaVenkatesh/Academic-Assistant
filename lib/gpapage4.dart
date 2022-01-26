import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:async';
import 'gpa_calc4.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GPA4 extends StatefulWidget{
  final double score4;
  GPA4(this.score4);
  @override
  GPAState4 createState() => new GPAState4(score4);
}
class GPAState4 extends State<GPA4>{
  SharedPreferences prefs;
  TextEditingController controller = new TextEditingController();
  int n4;
  final double score4;
  GPAState4(this.score4);
  double res4;
  initState() {
    super.initState();
    init();
  }

  void init() async{
    prefs = await SharedPreferences.getInstance();
    prefs.commit();
    res4 = (prefs.getDouble('res4') ?? 0);
    setState(() {
      res4;
    });

  }
  void set()
  {
    setState(() {
      res4=score4;
    });
    prefs.setDouble('res3', res4);
  }
  @override
  Widget build(BuildContext context){

    return new Scaffold(
      appBar: new AppBar(title: new Text("GPA calculator"), backgroundColor: Colors.purple[800]),
      backgroundColor: Colors.white,
      body: new Container(
        decoration: new BoxDecoration(border: new Border.all(color: Colors.transparent,width: 25.0),color: Colors.transparent),
        child: new ListView(
          children: <Widget>[
            new TextField(
              textAlign: TextAlign.center,
              autofocus: true,
              decoration: InputDecoration(hintText: 'How many Subjects did you have',
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
              /*decoration: new InputDecoration(
                  fillColor: Colors.deepOrangeAccent,

                  hintText: "How many subjects did you have ",
                  hintStyle: new TextStyle(color: Colors.black54)
              ),*/
              keyboardType: TextInputType.number,
              controller: controller,
              onChanged: (String str){
                setState((){
                  if(controller.text=="")
                    n4=0;
                  n4=int.parse(controller.text);
                });
              },
            ),
            new IconButton(
              icon:new Icon(Icons.arrow_forward),
              onPressed: (){
                if(n4 is int && n4>0){
                  int pass=n4;
                  n4=0;
                  controller.text="";
                  Navigator.of(context).push(new MaterialPageRoute(builder:(BuildContext context)=>new GPAcalc4(pass)));
                }
                else{
                  controller.text="";
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
                    new Text("Your GPA : " + res4.toStringAsFixed(res4.truncateToDouble() == res4 ? 0 : 3),style: new TextStyle(color: Colors.purple[800],fontWeight: FontWeight.bold,fontSize: 25.0)),
                    //new Text(res.toStringAsFixed(res.truncateToDouble() == res ? 0 : 3),style: new TextStyle(color: Colors.purple,fontWeight: FontWeight.bold,fontSize: 25.0)),
                  ]
              ),
            )
          ],
        ),
      ),
    );
  }
  Future<Null> alert() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Alert!'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text('Please enter some value to calculate'),
                new Text(''),
              ],
            ),
          ),
          actions: <Widget>[
            new TextButton(
              child: new Text('Okay'),
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



