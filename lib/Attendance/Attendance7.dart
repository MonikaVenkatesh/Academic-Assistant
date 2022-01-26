import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Attendance7 extends StatefulWidget {
  @override
  State createState() => new _Attendance7();
}

class _Attendance7 extends State<Attendance7> {

  SharedPreferences prefs;

  String title7 = "Number of classes";
  bool isEditable=false;

  var days7=0.0,afterPercent7=0.0,canBunk7=0.0,last7=0.0,res7=0.0;
  int result7=0;

  final TextEditingController t1 = new TextEditingController();

  initState() {
    super.initState();
    init();
  }

  void init() async{
    prefs = await SharedPreferences.getInstance();
    prefs.commit();
    days7 = (prefs.getDouble('days7') ?? 0);
    afterPercent7 = (prefs.getDouble('afterPercent7') ?? 0);
    canBunk7 = (prefs.getDouble('canBunk7') ?? 0);
    last7 = (prefs.getDouble('last7') ?? 0);
    res7 = (prefs.getDouble('res7') ?? 0);
    result7 = (prefs.getInt('result7') ?? 0);
    title7 = (prefs.getString('title7') ?? "Enter number of classes");
    //res = last - 1;
    setState(() {
      days7;
      afterPercent7;
      canBunk7;
      res7;
      result7;
      title7;
    });

  }

  void first() {
    setState(() {
      days7 = double.parse(t1.text);
      afterPercent7 = days7 * (0.75);
      canBunk7 = days7 - afterPercent7;
      var daystemp=days7.toInt();
      title7 = daystemp.toString();
      res7 = canBunk7;
      result7 = res7.toInt();
    });
    prefs.setDouble('days7', days7);
    prefs.setDouble('afterPercent7', afterPercent7);
    prefs.setDouble('canBunk7', canBunk7);
    prefs.setString('title7', title7);
    prefs.setDouble('res7', res7);
    prefs.setInt('result7', result7);
  }

  void remain() {
    setState(() {
      res7 = res7 - 1;
      result7 = res7.toInt();
    });
    prefs.setDouble('res7', res7);
    prefs.setInt('result7', result7);
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
                        ? Text(title7)
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
                          setState(() => {isEditable = false, title7 = value,first()});
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
                      "\n\n You still can bunk only $result7 classes \n"
                  ),
                ],
              ),
            )
        )
    );
  }
}


