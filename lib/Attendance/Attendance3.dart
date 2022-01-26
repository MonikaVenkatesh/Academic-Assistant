import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Attendance3 extends StatefulWidget {
  @override
  State createState() => new _Attendance3();
}

class _Attendance3 extends State<Attendance3> {

  SharedPreferences prefs;

  String title3 = "Number of classes";
  bool isEditable=false;

  var days3=0.0,afterPercent3=0.0,canBunk3=0.0,last3=0.0,res3=0.0;
  int result3=0;

  final TextEditingController t1 = new TextEditingController();

  initState() {
    super.initState();
    init();
  }

  void init() async{
    prefs = await SharedPreferences.getInstance();
    prefs.commit();
    days3 = (prefs.getDouble('days3') ?? 0);
    afterPercent3 = (prefs.getDouble('afterPercent3') ?? 0);
    canBunk3 = (prefs.getDouble('canBunk3') ?? 0);
    last3 = (prefs.getDouble('last3') ?? 0);
    res3 = (prefs.getDouble('res3') ?? 0);
    result3 = (prefs.getInt('result3') ?? 0);
    title3 = (prefs.getString('title3') ?? "Enter number of classes");
    //res = last - 1;
    setState(() {
      days3;
      afterPercent3;
      canBunk3;
      res3;
      result3;
      title3;
    });

  }

  void first() {
    setState(() {
      days3 = double.parse(t1.text);
      afterPercent3 = days3 * (0.75);
      canBunk3 = days3 - afterPercent3;
      var daystemp=days3.toInt();
      title3 = daystemp.toString();
      res3 = canBunk3;
      result3 = res3.toInt();
    });
    prefs.setDouble('days3', days3);
    prefs.setDouble('afterPercent3', afterPercent3);
    prefs.setDouble('canBunk3', canBunk3);
    prefs.setString('title3', title3);
    prefs.setDouble('res3', res3);
    prefs.setInt('result3', result3);
  }

  void remain() {
    setState(() {
      res3 = res3 - 1;
      result3 = res3.toInt();
    });
    prefs.setDouble('res3', res3);
    prefs.setInt('result3', result3);
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
                        ? Text(title3)
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
                          setState(() => {isEditable = false, title3 = value,first()});
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
                      "\n\n You still can bunk only $result3 classes \n"
                  ),
                ],
              ),
            )
        )
    );
  }
}


