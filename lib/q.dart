import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class marks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(

            body: Center(
                child: TextFieldNumeric()
            )
        )
    );
  }
}

class TextFieldNumeric extends StatefulWidget {

  NumericTextFieldWidget createState() => NumericTextFieldWidget();

}

class NumericTextFieldWidget extends State {

  SharedPreferences prefs;
  FlutterLocalNotificationsPlugin fltrNotification;
  DateTime _dateTime;
  var calc=0;
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
      if(_dateTime==now)
        calc = 0;
      else {
        calc = _dateTime.difference(now).inDays +1;
        dur=_dateTime.difference(now);
        timestamp = curr.millisecondsSinceEpoch;
        }


    });
    prefs.setInt('calc', calc);
    prefs.setInt('timestamp', timestamp);
    _showNotification();
  }
  void timer() {
    setState(() {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
      DateTime now=DateTime.now();
      dur=_dateTime.difference(now);
    });

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
  String title2 = "Enter both fields";
  String title3 = "Set goal";
  String ss;
  String og ='O';String aplusg ='A+'; String ag ='A'; String bplusg ='B+';String bg ='B';
  bool isEditable=false;
  bool isEnabled=false;
  bool isTimer=false;
  bool isFull1 = false;
  bool isFull2 = false;
  bool goal_selected = false;
  var assessone = 0.0,assesstwo=0.0,a=0.0,b=0.0,c=0.0,remain=0.0,remaing=0.0;
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
    });
  }
  void init(){

    setState(() {
      assesstwo = double.parse(numbertwo.text);
      a = (assessone + assesstwo)/2;
      b= 50-a;
      remain = b*2;


      if(ss == og)
      {
        remaing = 91-a;
      }
      if(ss == aplusg)
      {
        remaing = 81-a;
      }
      if(ss == ag)
      {
        remaing = 71-a;
      }
      if(ss == bplusg)
      {
        remaing = 61-a;
      }
      if(ss == bg)
      {
        remaing = 51-a;
      }



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

        body: Center(
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
                    ss = _val;init();goal_selected=true;
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
                    ? Text(title)
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
                      setState(() => {validateTextField(numberone.text),isEditable = false,isFull1=true, title = value,assign()});
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
                    ? Text(title1)
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
                      setState(() => {isEnabled = false,isFull2=true, title1 = value,init()});
                    }),
              ),
              Padding(
                padding: EdgeInsets.all(4),
              ),
              Container(
                child: (!isFull1 || !isFull2) ? Text(title2)
                    : new Text(

                    "\n\n should get $remain marks to pass $calc"

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
                          child: Text(remaining_days),
                        ),
                        onTap: () {
                              calc_days();
                              remaining_days = calc.toString()=="-18750" ? "0" : calc.toString();
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
                            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 8),
                            textStyle: TextStyle(
                              fontSize: 17,
                            )
                        ),

                        onPressed: () {
                          showDatePicker(
                              context: context,
                              initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                              firstDate: DateTime(2001),
                              lastDate: DateTime(2030),
                          ).then((date) {
                            setState(() {
                              set(date);
                            });
                          });
                        },
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Container(
                        margin: const EdgeInsets.only(right: 10, left: 10),

                        padding: EdgeInsets.all(1.0),
                        child: calc.toString()=="-11750"
                            ? Text("Select Exam Date !!")
                            : (dur!=Duration(days: 00, hours: 00, minutes: 00, seconds: 00)) ?
                        new InkWell(
                          child: Container(
                            //padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context).buttonColor,
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                            //child: Text(remaining_days),
                            child: Expanded(
                              child: new Container(
                                //margin: const EdgeInsets.all(0),
                                //padding: EdgeInsets.only(left: 0, right: 0),
                                child: !isTimer ? Icon(Icons.timer) : new SlideCountdownClock(duration: dur,separator: ":"),

                              ),
                            ),
                          ),
                          onTap: ()
                          {
                            calc_days();
                            timer();
                            isTimer=true;
                          },
                        ) :
                        Text("Exam Ended !!")
                        ,
                      ),
                      /*new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new InkWell(
                            child: Container(
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).buttonColor,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              //child: Text(remaining_days),
                              child: new Container(
                                margin: const EdgeInsets.only(right: 80, left: 80),
                                padding: EdgeInsets.all(0.05),
                                child: !isTimer ? Icon(Icons.timer) : new SlideCountdownClock(duration: dur,separator: ":"),

                              ),
                            ),
                            onTap: ()
                            {
                              calc_days();
                              timer();
                              isTimer=true;
                            },
                          ),
                        ],
                      ),*/

                    ],
                  ),
                ),
              )





            ],
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