import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Attendance8 extends StatefulWidget {
  @override
  State createState() => new _Attendance8();
}

class _Attendance8 extends State<Attendance8> {

  SharedPreferences prefs;

  String title8 = "Number of classes";
  bool isEditable=false;

  var days8=0.0,afterPercent8=0.0,canBunk8=0.0,last8=0.0,res8=0.0;
  int result=0;

  final TextEditingController t1 = new TextEditingController();

  initState() {
    super.initState();
    init();
  }

  void init() async{
    prefs = await SharedPreferences.getInstance();
    prefs.commit();
    days8 = (prefs.getDouble('days8') ?? 0);
    afterPercent8 = (prefs.getDouble('afterPercent8') ?? 0);
    canBunk8 = (prefs.getDouble('canBunk8') ?? 0);
    last8 = (prefs.getDouble('last8') ?? 0);
    res8 = (prefs.getDouble('res8') ?? 0);
    result = (prefs.getInt('result8') ?? 0);
    title8 = (prefs.getString('title8') ?? "Enter number of classes");
    //res = last - 1;
    setState(() {
      days8;
      afterPercent8;
      canBunk8;
      res8;
      result;
      title8;
    });

  }

  void first() {
    setState(() {
      days8 = double.parse(t1.text);
      afterPercent8 = days8 * (0.75);
      canBunk8 = days8 - afterPercent8;
      var daystemp=days8.toInt();
      title8 = daystemp.toString();
      res8 = canBunk8;
      result = res8.toInt();
    });
    prefs.setDouble('days8', days8);
    prefs.setDouble('afterPercent8', afterPercent8);
    prefs.setDouble('canBunk8', canBunk8);
    prefs.setString('title8', title8);
    prefs.setDouble('res8', res8);
    prefs.setInt('result8', result);
  }

  void remain() {
    setState(() {
      res8 = res8 - 1;
      result = res8.toInt();
    });
    prefs.setDouble('res', res8);
    prefs.setInt('result', result);
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
                        ? Text(title8)
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
                          setState(() => {isEditable = false, title8 = value,first()});
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
                      "\n\n You still can bunk only $result classes \n"
                  ),
                ],
              ),
            )
        )
    );
  }
}


