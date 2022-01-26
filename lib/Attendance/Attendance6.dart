import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Attendance6 extends StatefulWidget {
  @override
  State createState() => new _Attendance6();
}

class _Attendance6 extends State<Attendance6> {

  SharedPreferences prefs;

  String title6 = "Number of classes";
  bool isEditable=false;

  var days6=0.0,afterPercent6=0.0,canBunk6=0.0,last6=0.0,res6=0.0;
  int result6=0;

  final TextEditingController t1 = new TextEditingController();

  initState() {
    super.initState();
    init();
  }

  void init() async{
    prefs = await SharedPreferences.getInstance();
    prefs.commit();
    days6 = (prefs.getDouble('days6') ?? 0);
    afterPercent6 = (prefs.getDouble('afterPercent6') ?? 0);
    canBunk6 = (prefs.getDouble('canBunk6') ?? 0);
    last6 = (prefs.getDouble('last6') ?? 0);
    res6 = (prefs.getDouble('res6') ?? 0);
    result6 = (prefs.getInt('result6') ?? 0);
    title6 = (prefs.getString('title6') ?? "Enter number of classes");
    //res = last - 1;
    setState(() {
      days6;
      afterPercent6;
      canBunk6;
      res6;
      result6;
      title6;
    });

  }

  void first() {
    setState(() {
      days6 = double.parse(t1.text);
      afterPercent6 = days6 * (0.75);
      canBunk6 = days6 - afterPercent6;
      var daystemp=days6.toInt();
      title6 = daystemp.toString();
      res6 = canBunk6;
      result6 = res6.toInt();
    });
    prefs.setDouble('days6', days6);
    prefs.setDouble('afterPercent6', afterPercent6);
    prefs.setDouble('canBunk6', canBunk6);
    prefs.setString('title6', title6);
    prefs.setDouble('res6', res6);
    prefs.setInt('result6', result6);
  }

  void remain() {
    setState(() {
      res6 = res6 - 1;
      result6 = res6.toInt();
    });
    prefs.setDouble('res', res6);
    prefs.setInt('result', result6);
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
                        ? Text(title6)
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
                          setState(() => {isEditable = false, title6 = value,first()});
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
                      "\n\n You still can bunk only $result6 classes \n"
                  ),
                ],
              ),
            )
        )
    );
  }
}


