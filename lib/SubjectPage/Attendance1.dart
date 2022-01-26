import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Attendance1 extends StatefulWidget {
  @override
  State createState() => new _Attendance1();
}

class _Attendance1 extends State<Attendance1> {

  SharedPreferences prefs;

  String title1 = "Number of classes";
  bool isEditable=false;

  var days1=0.0,afterPercent1=0.0,canBunk1=0.0,last1=0.0,res1=0.0;
  int result1=0;

  final TextEditingController t1 = new TextEditingController();

  initState() {
    super.initState();
    init();
  }

  void init() async{
    prefs = await SharedPreferences.getInstance();
    prefs.commit();
    days1 = (prefs.getDouble('days1') ?? 0);
    afterPercent1 = (prefs.getDouble('afterPercent1') ?? 0);
    canBunk1 = (prefs.getDouble('canBunk1') ?? 0);
    last1 = (prefs.getDouble('last1') ?? 0);
    res1 = (prefs.getDouble('res1') ?? 0);
    result1 = (prefs.getInt('result1') ?? 0);
    title1 = (prefs.getString('title1') ?? "Enter number of classes");
    //res = last - 1;
    setState(() {
      days1;
      afterPercent1;
      canBunk1;
      res1;
      result1;
      title1;
    });

  }

  void first() {
    setState(() {
      days1 = double.parse(t1.text);
      afterPercent1 = days1 * (0.75);
      canBunk1 = days1 - afterPercent1;
      var daystemp=days1.toInt();
      title1 = daystemp.toString();
      res1 = canBunk1;
      result1 = res1.toInt();
    });
    prefs.setDouble('days1', days1);
    prefs.setDouble('afterPercent1', afterPercent1);
    prefs.setDouble('canBunk1', canBunk1);
    prefs.setString('title1', title1);
    prefs.setDouble('res1', res1);
    prefs.setInt('result1', result1);
  }

  void remain() {
    setState(() {
      res1 = res1 - 1;
      result1 = res1.toInt();
    });
    prefs.setDouble('res1', res1);
    prefs.setInt('result1', result1);
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
                        ? Text(title1)
                        : TextFormField(
                      //initialValue: ,
                        controller: t1,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(hintText: 'Number of classes',
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
                          setState(() => {isEditable = false, title1 = value,first()});
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
                      "\n\n You still can bunk only $result1 classes \n"
                  ),
                ],
              ),
            )
        )
    );
  }
}


