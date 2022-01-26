import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Attendance2 extends StatefulWidget {
  @override
  State createState() => new _Attendance2();
}

class _Attendance2 extends State<Attendance2> {

  SharedPreferences prefs;

  String title2 = "Number of classes";
  bool isEditable=false;

  var days2=0.0,afterPercent2=0.0,canBunk2=0.0,last2=0.0,res2=0.0;
  int result2=0;

  final TextEditingController t1 = new TextEditingController();

  initState() {
    super.initState();
    init();
  }

  void init() async{
    prefs = await SharedPreferences.getInstance();
    prefs.commit();
    days2 = (prefs.getDouble('days2') ?? 0);
    afterPercent2 = (prefs.getDouble('afterPercent2') ?? 0);
    canBunk2 = (prefs.getDouble('canBunk2') ?? 0);
    last2 = (prefs.getDouble('last2') ?? 0);
    res2 = (prefs.getDouble('res2') ?? 0);
    result2 = (prefs.getInt('result2') ?? 0);
    title2 = (prefs.getString('title2') ?? "Enter number of classes");
    //res = last - 1;
    setState(() {
      days2;
      afterPercent2;
      canBunk2;
      res2;
      result2;
      title2;
    });

  }

  void first() {
    setState(() {
      days2 = double.parse(t1.text);
      afterPercent2 = days2 * (0.75);
      canBunk2 = days2 - afterPercent2;
      var daystemp=days2.toInt();
      title2 = daystemp.toString();
      res2 = canBunk2;
      result2 = res2.toInt();
    });
    prefs.setDouble('days2', days2);
    prefs.setDouble('afterPercent2', afterPercent2);
    prefs.setDouble('canBunk2', canBunk2);
    prefs.setString('title2', title2);
    prefs.setDouble('res2', res2);
    prefs.setInt('result2', result2);
  }

  void remain() {
    setState(() {
      res2 = res2 - 1;
      result2 = res2.toInt();
    });
    prefs.setDouble('res2', res2);
    prefs.setInt('result2', result2);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(
              "Attendance"
          ),
          backgroundColor: Colors.purple[800],
        ),
        backgroundColor: Colors.white,
        /*appBar: new AppBar(
          backgroundColor: Colors.white,
          title: new Text("Bunking Manager",
            style: TextStyle(color: Colors.purple),),
        ),*/
        body: new Container(
            padding: const EdgeInsets.only(left: 40.0,top: 40.0, right: 40.0,bottom: 170.0),
            child: SingleChildScrollView(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(30)),
                  Container(
                    child: !isEditable
                        ? Text(title2)
                        : TextFormField(
                      //initialValue: ,
                        controller: t1,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(hintText: 'Enter assessment two marks',
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
                        onFieldSubmitted: (value) {
                          setState(() => {isEditable = false, title2 = value,first()});
                        }),),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      setState(() => {
                        isEditable = true,
                      });
                    },
                  ),
                  new Text(
                      "\n\nHelp :\n"
                          "3 credit subjects = 45 classes\n"
                          "4 credit subjects = 60 classes"
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                  ),
                  new Container(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new ElevatedButton(
                            child: new Text("Bunked Today Class"),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.purple[800],
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 17, vertical: 8),
                                textStyle: TextStyle(
                                  fontSize: 17,
                                )
                            ),
                            onPressed: (){remain();}
                        )
                      ],
                    ),
                  ),
                  new Text(
                      "\n\n You still can bunk only $result2 classes \n"
                  ),
                ],
              ),
            )
        )
    );
  }
}


