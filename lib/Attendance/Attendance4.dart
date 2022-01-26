import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Attendance4 extends StatefulWidget {
  @override
  State createState() => new _Attendance4();
}

class _Attendance4 extends State<Attendance4> {

  SharedPreferences prefs;

  String title4 = "Number of classes";
  bool isEditable=false;

  var days4=0.0,afterPercent4=0.0,canBunk4=0.0,last4=0.0,res4=0.0;
  int result4=0;

  final TextEditingController t1 = new TextEditingController();

  initState() {
    super.initState();
    init();
  }

  void init() async{
    prefs = await SharedPreferences.getInstance();
    prefs.commit();
    days4 = (prefs.getDouble('days4') ?? 0);
    afterPercent4 = (prefs.getDouble('afterPercent4') ?? 0);
    canBunk4 = (prefs.getDouble('canBunk4') ?? 0);
    last4 = (prefs.getDouble('last4') ?? 0);
    res4 = (prefs.getDouble('res4') ?? 0);
    result4 = (prefs.getInt('result4') ?? 0);
    title4 = (prefs.getString('title4') ?? "Enter number of classes");
    //res = last - 1;
    setState(() {
      days4;
      afterPercent4;
      canBunk4;
      res4;
      result4;
      title4;
    });

  }

  void first() {
    setState(() {
      days4 = double.parse(t1.text);
      afterPercent4 = days4 * (0.75);
      canBunk4 = days4 - afterPercent4;
      var daystemp=days4.toInt();
      title4 = daystemp.toString();
      res4 = canBunk4;
      result4 = res4.toInt();
    });
    prefs.setDouble('days4', days4);
    prefs.setDouble('afterPercent4', afterPercent4);
    prefs.setDouble('canBunk4', canBunk4);
    prefs.setString('title4', title4);
    prefs.setDouble('res4', res4);
    prefs.setInt('result4', result4);
  }

  void remain() {
    setState(() {
      res4 = res4 - 1;
      result4 = res4.toInt();
    });
    prefs.setDouble('res', res4);
    prefs.setInt('result', result4);
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
                        ? Text(title4)
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
                          setState(() => {isEditable = false, title4 = value,first()});
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
                      "\n\n You still can bunk only $result4 classes \n"
                  ),
                ],
              ),
            )
        )
    );
  }
}


