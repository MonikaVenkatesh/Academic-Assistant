import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';




class TextFieldNumeric8 extends StatefulWidget {

  NumericTextFieldWidget8 createState() => NumericTextFieldWidget8();

}

class NumericTextFieldWidget8 extends State {

  SharedPreferences prefs8;
  FlutterLocalNotificationsPlugin fltrNotification8;
  DateTime _dateTime8;
  var calc8;
  int val8;
  int timestamp8;
  static Duration d8 = Duration(days: 00, hours: 00, minutes: 00, seconds: 00);
  static Duration dur8;

  /*initState() {
    super.initState();
    init();
  }
  void init() async{
    prefs = await SharedPreferences.getInstance();
    prefs.commit();
    _dateTime = (prefs.getString('_dateTime') ?? 0);
    dur = (prefs.getString('dur') ?? 0);
    setState(() {
      _dateTime;
      dur;
    });
  }*/

  initState() {
    super.initState();
    var androidInitilize8 = new AndroidInitializationSettings('app_icon');
    var iOSinitilize8 = new IOSInitializationSettings();
    var initilizationsSettings8 =
    new InitializationSettings(androidInitilize8, iOSinitilize8);
    fltrNotification8 = new FlutterLocalNotificationsPlugin();
    fltrNotification8.initialize(initilizationsSettings8,
        onSelectNotification: notificationSelected);
    initdate();
    init();
  }
  Future _showNotification() async {
    var androidDetails8 = new AndroidNotificationDetails(
        "ID", "programmer", "channel",
        importance: Importance.Max);
    var iSODetails8 = new IOSNotificationDetails();
    var generalNotificationDetails8 =
    new NotificationDetails(androidDetails8, iSODetails8);

    var scheduledTime8;

    scheduledTime8 = DateTime.now().add(Duration(seconds: calc8));


    fltrNotification8.schedule(
        1, "You have an exam today", "All the Best!", scheduledTime8, generalNotificationDetails8);
  }

  void timer() {
    setState(() {
      DateTime dateTime8 = DateTime.fromMillisecondsSinceEpoch(timestamp8);
      DateTime now8=DateTime.now();
      dur8=_dateTime8.difference(now8);
    });

  }

  void initdate() async{
    prefs8 = await SharedPreferences.getInstance();
    prefs8.commit();
    calc8 = (prefs8.getInt('calc8') ?? 0);
    timestamp8 = (prefs8.getInt('timestamp8') ?? 0);
    setState(() {
      calc8;
      timestamp8;
    });

  }

  void set(DateTime curr)
  {
    setState(() {
      DateTime now8=DateTime.now();
      _dateTime8 = curr;
      timestamp8 = curr.millisecondsSinceEpoch;
      dur8=_dateTime8.difference(now8);
      calc8 = _dateTime8.difference(now8).inDays +1;
    });
    prefs8.setInt('calc8', calc8);
    prefs8.setInt('timestamp8', timestamp8);
    _showNotification();
  }

  void calc_days() {
    setState(() {
      DateTime dateTime8 = DateTime.fromMillisecondsSinceEpoch(timestamp8);
      set(dateTime8);
    });
  }


  final numberone8 = TextEditingController();
  final numbertwo8 = TextEditingController();
  String remaining_days8 = "How many days remaining??";
  String title8 = "marks";
  String title18 = "marks";
  String titlea18 = "Enter Assess 1 marks";
  String titlea28 = "Enter Assess 2 marks";
  String title28 = "Enter both fields";
  String title38 = "Set goal";
  String ss8;
  String og8 ='O';String aplusg8 ='A+'; String ag8 ='A'; String bplusg8 ='B+';String bg8 ='B';
  bool isEditable8=false;
  bool isEnabled8=false;
  bool isFull18 = false;
  bool isFull28 = false;
  bool isTimer8=false;
  bool goal_selected8 = false;
  double assessone8 = 0.0,assesstwo8=0.0,a8=0.0,b8=0.0,c8=0.0,remain8=50.0,remaing8=91.0;
  SharedPreferences pref8;
  bool userNameValidate8 = false;
  bool validateTextField(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        userNameValidate8 = true;
      });
      return false;
    }
    setState(() {
      userNameValidate8 = false;
    });
    return true;
  }

  void assign()
  {

    setState(() {
      assessone8 = double.parse(numberone8.text);
      titlea18 = assessone8.toString();
    });
    assign2();
    pref8.setDouble('assessone8', assessone8);
    pref8.setString('titlea18', titlea18);
  }
  void assign2(){

    setState(() {
      assesstwo8 = double.parse(numbertwo8.text);
      titlea28 = assesstwo8.toString();

      a8 = (assessone8 + assesstwo8)/2;
      b8= 50-a8;
      remain8 = b8*2;


      if(ss8 == og8)
      {
        remaing8 = (91-a8)*2;
      }
      if(ss8 == aplusg8)
      {
        remaing8 = (81-a8)*2;
      }
      if(ss8 == ag8)
      {
        remaing8 = (71-a8)*2;
      }
      if(ss8 == bplusg8)
      {
        remaing8 = (61-a8)*2;
      }


    });
    pref8.setString('ss8', ss8);
    pref8.setDouble('assesstwo8', assesstwo8);
    pref8.setDouble('remain8', remain8);
    pref8.setDouble('remaing8', remaing8);
    pref8.setString('titlea28', titlea28);

  }
  void init() async {
    pref8 = await SharedPreferences.getInstance();
    pref8.commit();
    assessone8 = (pref8.getDouble('assessone8') ?? 0);
    assesstwo8 = (pref8.getDouble('assesstwo8') ?? 0);
    remain8 = (pref8.getDouble('remain8') ?? 50);
    remaing8 = (pref8.getDouble('remaing8') ?? 91);
    ss8 = (pref8.getString('ss8') ?? "O");
    titlea18 = (pref8.getString('titlea18') ?? "Enter Assess 1 marks");
    titlea28 = (pref8.getString('titlea28') ?? "Enter Assess 2 marks");
    goal_selected8 =(pref8.getBool('goal_selected8') ?? false);
    isFull18 = (pref8.getBool('isFull18') ?? false);
    isFull28 = (pref8.getBool('isFull28') ?? false);
    setState(() {
      assessone8;
      assesstwo8;
      remain8;
      remaing8;
      ss8;
      titlea18;
      titlea28;
      goal_selected8;
      isFull18;
      isFull28;
    });

  }


  @override
  Widget build(BuildContext context) {
    String numberValidator(String value) {
      if(value == null) {
        return null;
      }
      final n = num.tryParse(value);
      if(n == null) {
        return '"$value" is not a valid number';
      }
      return null;
    }
    return Scaffold(

        appBar: AppBar(
          title: Text(
              "Marks"
          ),
          backgroundColor: Colors.purple[800],
        ),

        body: Center(
          child: SingleChildScrollView(
            child: new  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DropdownButton(
                  value: ss8,
                  items: [
                    DropdownMenuItem(
                      child: Text("O"),
                      value: "O",
                    ),
                    DropdownMenuItem(
                      child: Text("A+"),
                      value: "A+",
                    ),
                    DropdownMenuItem(
                      child: Text("A"),
                      value: "A",
                    ),
                    DropdownMenuItem(
                      child: Text("B+"),
                      value: "B+",
                    ),
                  ],
                  hint: Text(
                    "Set your goal",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (_val) {
                    setState(() {
                      ss8 = _val;assign2();assign();goal_selected8=true;
                      pref8.setBool('goal_selected8', true);
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.edit,color: Colors.black),
                  onPressed: () {
                    setState(() => {
                      isEditable8 = true,
                    });
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(right: 80, left: 80),

                  padding: EdgeInsets.all(8.0),
                  child: !isEditable8
                      ? Text(titlea18)
                      : TextFormField(
                    //initialValue: title,
                      controller: numberone8,
                      autocorrect: true,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(hintText: 'Enter assessment one marks',
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
                        setState(() => {validateTextField(numberone8.text),isEditable8 = false,isFull18=true, pref8.setBool('isFull18', true),titlea18 = value,assign()});
                      }),
                ),
                IconButton(
                  icon: Icon(Icons.edit,color: Colors.black),
                  onPressed: () {
                    setState(() => {
                      isEnabled8 = true,
                    });
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(right: 80, left: 80),

                  padding: EdgeInsets.all(8.0),
                  child: !isEnabled8
                      ? Text(titlea28)
                      : TextFormField(
                    //initialValue: title,
                      controller: numbertwo8,
                      autocorrect: true,
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
                        setState(() => {isEnabled8 = false,isFull28=true,pref8.setBool('isFull28', true), titlea28 = value,assign2()});
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                ),
                Container(
                  child: (!isFull18 || !isFull28) ? Text(title28)
                      : new Text(

                      "\n\n should get $remain8 marks to pass"

                  ),

                ),

                Container(
                  child: (!goal_selected8) ? Text(title38)
                      : new Text(

                      "\nshould get $remaing8 marks to get to $ss8"

                  ),

                ),
                Padding(
                  padding: EdgeInsets.all(15),
                ),
                Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new InkWell(
                          child: Container(
                            padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context).buttonColor,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(remaining_days8),
                          ),
                          onTap: () {
                            calc_days();
                            remaining_days8 = calc8.toString()=="-18850" ? "0" : calc8.toString();
                            /*calc_days();
                            remaining_days = (calc==0)?"0":calc.toString();*/
                          },
                        ),
                        /*Text(
              /*_dateTime==null ? 'Enter your semester exam date' :*/ calc.toString()+' more days to go',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),*/
                        Padding(padding: EdgeInsets.all(5)),
                        ElevatedButton(
                          child: Text('Exam Date'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.purple[800],
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                              textStyle: TextStyle(
                                fontSize: 18,
                              )
                          ),

                          onPressed: () {
                            showDatePicker(
                                context: context,
                                initialDate: _dateTime8 == null ? DateTime.now() : _dateTime8,
                                firstDate: DateTime(2001),
                                lastDate: DateTime(2030)
                            ).then((date) {
                              setState(() {
                                set(date);
                              });
                            });
                          },
                        ),
                        /*RaisedButton(
              child: Text('Exam Date'),
              onPressed: () {
                showDatePicker(
                    context: context,
                    initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2030)
                ).then((date) {
                  setState(() {
                    set(date);
                  });
                });
              },
            ),*/
                        Padding(padding: EdgeInsets.all(5)),
                        Container(
                          margin: const EdgeInsets.only(right: 80, left: 80),

                          padding: EdgeInsets.all(8.0),
                          child: calc8.toString()=="-18850"
                              ? Text("Select Exam Date !!")
                              : (dur8!=Duration(days: 00, hours: 00, minutes: 00, seconds: 00)) ?
                          new InkWell(
                            child: Container(
                              //padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).buttonColor,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              //child: Text(remaining_days),
                              child: Expanded(
                                child: new Container(
                                  //margin: const EdgeInsets.all(0),
                                  //padding: EdgeInsets.only(left: 0, right: 0),
                                  child: !isTimer8 ? Icon(Icons.timer) : new SlideCountdownClock(duration: dur8,separator: ":"),

                                ),
                              ),
                            ),
                            onTap: ()
                            {
                              calc_days();
                              timer();
                              isTimer8=true;
                            },
                          ) :
                          Text("Exam Ended !!")
                          ,
                        ),
                        //new SlideCountdownClock(duration: dur!=null ? dur :d),
                      ],
                    ),
                  ),
                )





              ],
            ),
          ),
        ));
  }
  Future notificationSelected(String payload) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("All the Best!"),
      ),
    );
  }
}