import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Attendance5 extends StatefulWidget {
  @override
  State createState() => new _Attendance5();
}

class _Attendance5 extends State<Attendance5> {

  SharedPreferences prefs;

  String title5 = "Number of classes";
  bool isEditable=false;

  var days5=0.0,afterPercent5=0.0,canBunk5=0.0,last5=0.0,res5=0.0;
  int result5=0;

  final TextEditingController t1 = new TextEditingController();

  initState() {
    super.initState();
    init();
  }

  void init() async{
    prefs = await SharedPreferences.getInstance();
    prefs.commit();
    days5 = (prefs.getDouble('days5') ?? 0);
    afterPercent5 = (prefs.getDouble('afterPercent5') ?? 0);
    canBunk5 = (prefs.getDouble('canBunk5') ?? 0);
    last5 = (prefs.getDouble('last5') ?? 0);
    res5 = (prefs.getDouble('res5') ?? 0);
    result5 = (prefs.getInt('result5') ?? 0);
    title5 = (prefs.getString('title5') ?? "Enter number of classes");
    //res = last - 1;
    setState(() {
      days5;
      afterPercent5;
      canBunk5;
      res5;
      result5;
      title5;
    });

  }

  void first() {
    setState(() {
      days5 = double.parse(t1.text);
      afterPercent5 = days5 * (0.75);
      canBunk5 = days5 - afterPercent5;
      var daystemp=days5.toInt();
      title5 = daystemp.toString();
      res5 = canBunk5;
      result5 = res5.toInt();
    });
    prefs.setDouble('days5', days5);
    prefs.setDouble('afterPercent5', afterPercent5);
    prefs.setDouble('canBunk5', canBunk5);
    prefs.setString('title5', title5);
    prefs.setDouble('res5', res5);
    prefs.setInt('result5', result5);
  }

  void remain() {
    setState(() {
      res5 = res5 - 1;
      result5 = res5.toInt();
    });
    prefs.setDouble('res', res5);
    prefs.setInt('result', result5);
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
                        ? Text(title5)
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
                          setState(() => {isEditable = false, title5 = value,first()});
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
                      "\n\n You still can bunk only $result5 classes \n"
                  ),
                ],
              ),
            )
        )
    );
  }
}


