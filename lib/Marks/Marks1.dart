import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';




class TextFieldNumeric1 extends StatefulWidget {

  NumericTextFieldWidget1 createState() => NumericTextFieldWidget1();

}

class NumericTextFieldWidget1 extends State {

  SharedPreferences prefs1;
  FlutterLocalNotificationsPlugin fltrNotification1;
  DateTime _dateTime1;
  var calc1;
  int val1;
  int timestamp1;
  static Duration d1 = Duration(days: 00, hours: 00, minutes: 00, seconds: 00);
  static Duration dur1;

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
    var androidInitilize1 = new AndroidInitializationSettings('app_icon');
    var iOSinitilize1 = new IOSInitializationSettings();
    var initilizationsSettings1 =
    new InitializationSettings(androidInitilize1, iOSinitilize1);
    fltrNotification1 = new FlutterLocalNotificationsPlugin();
    fltrNotification1.initialize(initilizationsSettings1,
        onSelectNotification: notificationSelected);
    initdate();
    init();
  }
  Future _showNotification() async {
    var androidDetails1 = new AndroidNotificationDetails(
        "ID", "programmer", "channel",
        importance: Importance.Max);
    var iSODetails1 = new IOSNotificationDetails();
    var generalNotificationDetails1 =
    new NotificationDetails(androidDetails1, iSODetails1);

    var scheduledTime1;

    scheduledTime1 = DateTime.now().add(Duration(seconds: calc1));


    fltrNotification1.schedule(
        1, "You have an exam today", "All the Best!", scheduledTime1, generalNotificationDetails1);
  }

  void timer() {
    setState(() {
      DateTime dateTime1 = DateTime.fromMillisecondsSinceEpoch(timestamp1);
      DateTime now1=DateTime.now();
      dur1=_dateTime1.difference(now1);
    });

  }

  void initdate() async{
    prefs1 = await SharedPreferences.getInstance();
    prefs1.commit();
    calc1 = (prefs1.getInt('calc1') ?? 0);
    timestamp1 = (prefs1.getInt('timestamp1') ?? 0);
    setState(() {
      calc1;
      timestamp1;
    });

  }

  void set(DateTime curr)
  {
    setState(() {
      DateTime now1=DateTime.now();
      _dateTime1 = curr;
      timestamp1 = curr.millisecondsSinceEpoch;
      dur1=_dateTime1.difference(now1);
      calc1 = _dateTime1.difference(now1).inDays +1;
    });
    prefs1.setInt('calc1', calc1);
    prefs1.setInt('timestamp1', timestamp1);
    _showNotification();
  }

  void calc_days() {
    setState(() {
      DateTime dateTime1 = DateTime.fromMillisecondsSinceEpoch(timestamp1);
      set(dateTime1);
    });
  }


  final numberone1 = TextEditingController();
  final numbertwo1 = TextEditingController();
  String remaining_days1 = "How many days remaining??";
  String title1 = "marks";
  String title11 = "marks";
  String titlea11 = "Enter Assess 1 marks";
  String titlea21 = "Enter Assess 2 marks";
  String title21 = "Enter both fields";
  String title31 = "Set goal";
  String ss1;
  String og1 ='O';String aplusg1 ='A+'; String ag1 ='A'; String bplusg1 ='B+';String bg1 ='B';
  bool isEditable1=false;
  bool isEnabled1=false;
  bool isFull11 = false;
  bool isFull21 = false;
  bool isTimer1=false;
  bool goal_selected1 = false;
  double assessone1 = 0.0,assesstwo1=0.0,a1=0.0,b1=0.0,c1=0.0,remain1=50.0,remaing1=91.0;
  SharedPreferences pref1;
  bool userNameValidate1 = false;
  bool validateTextField(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        userNameValidate1 = true;
      });
      return false;
    }
    setState(() {
      userNameValidate1 = false;
    });
    return true;
  }

  void assign()
  {

    setState(() {
      assessone1 = double.parse(numberone1.text);
      titlea11 = assessone1.toString();
    });
    assign2();
    pref1.setDouble('assessone1', assessone1);
    pref1.setString('titlea11', titlea11);
  }
  void assign2(){

    setState(() {
      assesstwo1 = double.parse(numbertwo1.text);
      titlea21 = assesstwo1.toString();

      a1 = (assessone1 + assesstwo1)/2;
      b1= 50-a1;
      remain1 = b1*2;


      if(ss1 == og1)
      {
        remaing1 = (91-a1)*2;
      }
      if(ss1 == aplusg1)
      {
        remaing1 = (81-a1)*2;
      }
      if(ss1 == ag1)
      {
        remaing1 = (71-a1)*2;
      }
      if(ss1 == bplusg1)
      {
        remaing1 = (61-a1)*2;
      }


    });
    pref1.setString('ss1', ss1);
    pref1.setDouble('assesstwo1', assesstwo1);
    pref1.setDouble('remain1', remain1);
    pref1.setDouble('remaing1', remaing1);
    pref1.setString('titlea21', titlea21);

  }
  void init() async {
    pref1 = await SharedPreferences.getInstance();
    pref1.commit();
    assessone1 = (pref1.getDouble('assessone1') ?? 0);
    assesstwo1 = (pref1.getDouble('assesstwo1') ?? 0);
    remain1 = (pref1.getDouble('remain1') ?? 50);
    remaing1 = (pref1.getDouble('remaing1') ?? 91);
    ss1 = (pref1.getString('ss1') ?? "O");
    titlea11 = (pref1.getString('titlea11') ?? "Enter Assess 1 marks");
    titlea21 = (pref1.getString('titlea21') ?? "Enter Assess 2 marks");
    goal_selected1 =(pref1.getBool('goal_selected1') ?? false);
    isFull11 = (pref1.getBool('isFull11') ?? false);
    isFull21 = (pref1.getBool('isFull21') ?? false);
    setState(() {
      assessone1;
      assesstwo1;
      remain1;
      remaing1;
      ss1;
      titlea11;
      titlea21;
      goal_selected1;
      isFull11;
      isFull21;
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
                  value: ss1,
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
                      ss1 = _val;assign2();assign();goal_selected1=true;
                      pref1.setBool('goal_selected1', true);
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.edit,color: Colors.black),
                  onPressed: () {
                    setState(() => {
                      isEditable1 = true,
                    });
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(right: 80, left: 80),

                  padding: EdgeInsets.all(8.0),
                  child: !isEditable1
                      ? Text(titlea11)
                      : TextFormField(
                    //initialValue: title,
                      controller: numberone1,
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
                        setState(() => {validateTextField(numberone1.text),isEditable1 = false,isFull11=true, pref1.setBool('isFull11', true),titlea11 = value,assign()});
                      }),
                ),
                IconButton(
                  icon: Icon(Icons.edit,color: Colors.black),
                  onPressed: () {
                    setState(() => {
                      isEnabled1 = true,
                    });
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(right: 80, left: 80),

                  padding: EdgeInsets.all(8.0),
                  child: !isEnabled1
                      ? Text(titlea21)
                      : TextFormField(
                    //initialValue: title,
                      controller: numbertwo1,
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
                        setState(() => {isEnabled1 = false,isFull21=true,pref1.setBool('isFull21', true), titlea21 = value,assign2()});
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                ),
                Container(
                  child: (!isFull11 || !isFull21) ? Text(title21)
                      : new Text(

                      "\n\n should get $remain1 marks to pass"

                  ),

                ),

                Container(
                  child: (!goal_selected1) ? Text(title31)
                      : new Text(

                      "\nshould get $remaing1 marks to get to $ss1"

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
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                            child: Text(remaining_days1),
                          ),
                          onTap: () {
                            calc_days();
                            remaining_days1 = calc1.toString()=="-11750" ? "0" : calc1.toString();
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
                              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 1),
                              textStyle: TextStyle(
                                fontSize: 17,
                              )
                          ),

                          onPressed: () {
                            showDatePicker(
                                context: context,
                                initialDate: _dateTime1 == null ? DateTime.now() : _dateTime1,
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
                          margin: const EdgeInsets.only(right: 10, left: 10),

                          padding: EdgeInsets.all(1.0),
                          child: calc1.toString()=="-11750"
                              ? Text("Select Exam Date !!")
                              : (dur1!=Duration(days: 00, hours: 00, minutes: 00, seconds: 00)) ?
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
                                  child: !isTimer1 ? Icon(Icons.timer) : new SlideCountdownClock(duration: dur1,separator: ":"),

                                ),
                              ),
                            ),
                            onTap: ()
                            {
                              calc_days();
                              timer();
                              isTimer1=true;
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