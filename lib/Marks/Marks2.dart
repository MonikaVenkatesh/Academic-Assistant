import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';




class TextFieldNumeric2 extends StatefulWidget {

  NumericTextFieldWidget2 createState() => NumericTextFieldWidget2();

}

class NumericTextFieldWidget2 extends State {

  SharedPreferences prefs;
  FlutterLocalNotificationsPlugin fltrNotification;
  DateTime _dateTime;
  var calc;
  int val;
  int timestamp;
  static Duration d = Duration(days: 00, hours: 00, minutes: 00, seconds: 00);
  static Duration dur;

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
    var androidInitilize = new AndroidInitializationSettings('app_icon');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings =
    new InitializationSettings(androidInitilize, iOSinitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings,
        onSelectNotification: notificationSelected);
    initdate();
    init();
  }
  Future _showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        "ID", "programmer", "channel",
        importance: Importance.Max);
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails =
    new NotificationDetails(androidDetails, iSODetails);

    var scheduledTime;

    scheduledTime = DateTime.now().add(Duration(seconds: calc));


    fltrNotification.schedule(
        1, "You have an exam today", "All the Best!", scheduledTime, generalNotificationDetails);
  }

  void timer() {
    setState(() {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
      DateTime now=DateTime.now();
      dur=_dateTime.difference(now);
    });

  }

  void initdate() async{
    prefs = await SharedPreferences.getInstance();
    prefs.commit();
    calc = (prefs.getInt('calc') ?? 0);
    timestamp = (prefs.getInt('timestamp') ?? 0);
    setState(() {
      calc;
      timestamp;
    });

  }

  void set(DateTime curr)
  {
    setState(() {
      DateTime now=DateTime.now();
      _dateTime = curr;
      timestamp = curr.millisecondsSinceEpoch;
      dur=_dateTime.difference(now);
      calc = _dateTime.difference(now).inDays +1;
    });
    prefs.setInt('calc', calc);
    prefs.setInt('timestamp', timestamp);
    _showNotification();
  }

  void calc_days() {
    setState(() {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
      set(dateTime);
    });
  }


  final numberone = TextEditingController();
  final numbertwo = TextEditingController();
  String remaining_days = "How many days remaining??";
  String title = "marks";
  String title1 = "marks";
  String titlea1 = "Enter Assessment 1 marks";
  String titlea2 = "Enter Assessment 2 marks";
  String title2 = "Enter both fields";
  String title3 = "Set goal";
  String ss;
  String og ='O';String aplusg ='A+'; String ag ='A'; String bplusg ='B+';String bg ='B';
  bool isEditable=false;
  bool isEnabled=false;
  bool isFull1 = false;
  bool isFull2 = false;
  bool isTimer=false;
  bool goal_selected = false;
  double assessone = 0.0,assesstwo=0.0,a=0.0,b=0.0,c=0.0,remain=50.0,remaing=91.0;
  SharedPreferences pref;
  bool userNameValidate = false;
  bool validateTextField(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        userNameValidate = true;
      });
      return false;
    }
    setState(() {
      userNameValidate = false;
    });
    return true;
  }

  void assign()
  {

    setState(() {
      assessone = double.parse(numberone.text);
      titlea1 = assessone.toString();
    });
    assign2();
    pref.setDouble('assessone', assessone);
    pref.setString('titlea1', titlea1);
  }
  void assign2(){

    setState(() {
      assesstwo = double.parse(numbertwo.text);
      titlea2 = assesstwo.toString();

      a = (assessone + assesstwo)/2;
      b= 50-a;
      remain = b*2;


      if(ss == og)
      {
        remaing = (91-a)*2;
      }
      if(ss == aplusg)
      {
        remaing = (81-a)*2;
      }
      if(ss == ag)
      {
        remaing = (71-a)*2;
      }
      if(ss == bplusg)
      {
        remaing = (61-a)*2;
      }


    });
    pref.setString('ss', ss);
    pref.setDouble('assesstwo', assesstwo);
    pref.setDouble('remain', remain);
    pref.setDouble('remaing', remaing);
    pref.setString('titlea2', titlea2);

  }
  void init() async {
    pref = await SharedPreferences.getInstance();
    pref.commit();
    assessone = (pref.getDouble('assessone') ?? 0);
    assesstwo = (pref.getDouble('assesstwo') ?? 0);
    remain = (pref.getDouble('remain') ?? 50);
    remaing = (pref.getDouble('remaing') ?? 91);
    ss = (pref.getString('ss') ?? "O");
    titlea1 = (pref.getString('titlea1') ?? "Enter Assessment 1 marks");
    titlea2 = (pref.getString('titlea2') ?? "Enter Assessment 2 marks");
    goal_selected =(pref.getBool('goal_selected') ?? false);
    isFull1 = (pref.getBool('isFull1') ?? false);
    isFull2 = (pref.getBool('isFull2') ?? false);
    setState(() {
      assessone;
      assesstwo;
      remain;
      remaing;
      ss;
      titlea1;
      titlea2;
      goal_selected;
      isFull1;
      isFull2;
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
                  value: ss,
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
                      ss = _val;assign2();assign();goal_selected=true;
                      pref.setBool('goal_selected', true);
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.edit,color: Colors.black),
                  onPressed: () {
                    setState(() => {
                      isEditable = true,
                    });
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(right: 80, left: 80),

                  padding: EdgeInsets.all(8.0),
                  child: !isEditable
                      ? Text(titlea1)
                      : TextFormField(
                    //initialValue: title,
                      controller: numberone,
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
                        setState(() => {validateTextField(numberone.text),isEditable = false,isFull1=true, pref.setBool('isFull1', true),titlea1 = value,assign()});
                      }),
                ),
                IconButton(
                  icon: Icon(Icons.edit,color: Colors.black),
                  onPressed: () {
                    setState(() => {
                      isEnabled = true,
                    });
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(right: 80, left: 80),

                  padding: EdgeInsets.all(8.0),
                  child: !isEnabled
                      ? Text(titlea2)
                      : TextFormField(
                    //initialValue: title,
                      controller: numbertwo,
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
                        setState(() => {isEnabled = false,isFull2=true,pref.setBool('isFull2', true), titlea2 = value,assign2()});
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                ),
                Container(
                  child: (!isFull1 || !isFull2) ? Text(title2)
                      : new Text(

                      "\n\n should get $remain marks to pass"

                  ),

                ),

                Container(
                  child: (!goal_selected) ? Text(title3)
                      : new Text(

                      "\nshould get $remaing marks to get to $ss"

                  ),

                ),
                Padding(
                  padding: EdgeInsets.all(15),
                ),






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