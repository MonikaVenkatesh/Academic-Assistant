import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';




class TextFieldNumeric6 extends StatefulWidget {

  NumericTextFieldWidget6 createState() => NumericTextFieldWidget6();

}

class NumericTextFieldWidget6 extends State {

  SharedPreferences prefs6;
  FlutterLocalNotificationsPlugin fltrNotification6;
  DateTime _dateTime6;
  var calc6;
  int val6;
  int timestamp6;
  static Duration d6 = Duration(days: 00, hours: 00, minutes: 00, seconds: 00);
  static Duration dur6;

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
    var androidInitilize6 = new AndroidInitializationSettings('app_icon');
    var iOSinitilize6 = new IOSInitializationSettings();
    var initilizationsSettings6 =
    new InitializationSettings(androidInitilize6, iOSinitilize6);
    fltrNotification6 = new FlutterLocalNotificationsPlugin();
    fltrNotification6.initialize(initilizationsSettings6,
        onSelectNotification: notificationSelected);
    initdate();
    init();
  }
  Future _showNotification() async {
    var androidDetails6 = new AndroidNotificationDetails(
        "ID", "programmer", "channel",
        importance: Importance.Max);
    var iSODetails6 = new IOSNotificationDetails();
    var generalNotificationDetails6 =
    new NotificationDetails(androidDetails6, iSODetails6);

    var scheduledTime6;

    scheduledTime6 = DateTime.now().add(Duration(seconds: calc6));


    fltrNotification6.schedule(
        1, "You have an exam today", "All the Best!", scheduledTime6, generalNotificationDetails6);
  }

  void timer() {
    setState(() {
      DateTime dateTime6 = DateTime.fromMillisecondsSinceEpoch(timestamp6);
      DateTime now6=DateTime.now();
      dur6=_dateTime6.difference(now6);
    });

  }

  void initdate() async{
    prefs6 = await SharedPreferences.getInstance();
    prefs6.commit();
    calc6 = (prefs6.getInt('calc6') ?? 0);
    timestamp6 = (prefs6.getInt('timestamp6') ?? 0);
    setState(() {
      calc6;
      timestamp6;
    });

  }

  void set(DateTime curr)
  {
    setState(() {
      DateTime now6=DateTime.now();
      _dateTime6 = curr;
      timestamp6 = curr.millisecondsSinceEpoch;
      dur6=_dateTime6.difference(now6);
      calc6 = _dateTime6.difference(now6).inDays +1;
    });
    prefs6.setInt('calc6', calc6);
    prefs6.setInt('timestamp6', timestamp6);
    _showNotification();
  }

  void calc_days() {
    setState(() {
      DateTime dateTime6 = DateTime.fromMillisecondsSinceEpoch(timestamp6);
      set(dateTime6);
    });
  }


  final numberone6 = TextEditingController();
  final numbertwo6 = TextEditingController();
  String remaining_days6 = "How many days remaining??";
  String title6 = "marks";
  String title16 = "marks";
  String titlea16 = "Enter Assess 1 marks";
  String titlea26 = "Enter Assess 2 marks";
  String title26 = "Enter both fields";
  String title36 = "Set goal";
  String ss6;
  String og6 ='O';String aplusg6 ='A+'; String ag6 ='A'; String bplusg6 ='B+';String bg6 ='B';
  bool isEditable6=false;
  bool isEnabled6=false;
  bool isFull16 = false;
  bool isFull26 = false;
  bool isTimer6=false;
  bool goal_selected6 = false;
  double assessone6 = 0.0,assesstwo6=0.0,a6=0.0,b6=0.0,c6=0.0,remain6=50.0,remaing6=91.0;
  SharedPreferences pref6;
  bool userNameValidate6 = false;
  bool validateTextField(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        userNameValidate6 = true;
      });
      return false;
    }
    setState(() {
      userNameValidate6 = false;
    });
    return true;
  }

  void assign()
  {

    setState(() {
      assessone6 = double.parse(numberone6.text);
      titlea16 = assessone6.toString();
    });
    assign2();
    pref6.setDouble('assessone6', assessone6);
    pref6.setString('titlea16', titlea16);
  }
  void assign2(){

    setState(() {
      assesstwo6 = double.parse(numbertwo6.text);
      titlea26 = assesstwo6.toString();

      a6 = (assessone6 + assesstwo6)/2;
      b6= 50-a6;
      remain6 = b6*2;


      if(ss6 == og6)
      {
        remaing6 = (91-a6)*2;
      }
      if(ss6 == aplusg6)
      {
        remaing6 = (81-a6)*2;
      }
      if(ss6 == ag6)
      {
        remaing6 = (71-a6)*2;
      }
      if(ss6 == bplusg6)
      {
        remaing6 = (61-a6)*2;
      }


    });
    pref6.setString('ss6', ss6);
    pref6.setDouble('assesstwo6', assesstwo6);
    pref6.setDouble('remain6', remain6);
    pref6.setDouble('remaing6', remaing6);
    pref6.setString('titlea26', titlea26);

  }
  void init() async {
    pref6 = await SharedPreferences.getInstance();
    pref6.commit();
    assessone6 = (pref6.getDouble('assessone6') ?? 0);
    assesstwo6 = (pref6.getDouble('assesstwo6') ?? 0);
    remain6 = (pref6.getDouble('remain6') ?? 50);
    remaing6 = (pref6.getDouble('remaing6') ?? 91);
    ss6 = (pref6.getString('ss6') ?? "O");
    titlea16 = (pref6.getString('titlea16') ?? "Enter Assess 1 marks");
    titlea26 = (pref6.getString('titlea26') ?? "Enter Assess 2 marks");
    goal_selected6 =(pref6.getBool('goal_selected6') ?? false);
    isFull16 = (pref6.getBool('isFull16') ?? false);
    isFull26 = (pref6.getBool('isFull26') ?? false);
    setState(() {
      assessone6;
      assesstwo6;
      remain6;
      remaing6;
      ss6;
      titlea16;
      titlea26;
      goal_selected6;
      isFull16;
      isFull26;
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
                  value: ss6,
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
                      ss6 = _val;assign2();assign();goal_selected6=true;
                      pref6.setBool('goal_selected6', true);
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.edit,color: Colors.black),
                  onPressed: () {
                    setState(() => {
                      isEditable6 = true,
                    });
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(right: 80, left: 80),

                  padding: EdgeInsets.all(8.0),
                  child: !isEditable6
                      ? Text(titlea16)
                      : TextFormField(
                    //initialValue: title,
                      controller: numberone6,
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
                        setState(() => {validateTextField(numberone6.text),isEditable6 = false,isFull16=true, pref6.setBool('isFull16', true),titlea16 = value,assign()});
                      }),
                ),
                IconButton(
                  icon: Icon(Icons.edit,color: Colors.black),
                  onPressed: () {
                    setState(() => {
                      isEnabled6 = true,
                    });
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(right: 80, left: 80),

                  padding: EdgeInsets.all(8.0),
                  child: !isEnabled6
                      ? Text(titlea26)
                      : TextFormField(
                    //initialValue: title,
                      controller: numbertwo6,
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
                        setState(() => {isEnabled6 = false,isFull26=true,pref6.setBool('isFull26', true), titlea26 = value,assign2()});
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                ),
                Container(
                  child: (!isFull16 || !isFull26) ? Text(title26)
                      : new Text(

                      "\n\n should get $remain6 marks to pass"

                  ),

                ),

                Container(
                  child: (!goal_selected6) ? Text(title36)
                      : new Text(

                      "\nshould get $remaing6 marks to get to $ss6"

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
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: Text(remaining_days6),
                          ),
                          onTap: () {
                            calc_days();
                            remaining_days6 = calc6.toString()=="-16750" ? "0" : calc6.toString();
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
                              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 6),
                              textStyle: TextStyle(
                                fontSize: 17,
                              )
                          ),

                          onPressed: () {
                            showDatePicker(
                                context: context,
                                initialDate: _dateTime6 == null ? DateTime.now() : _dateTime6,
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
                          margin: const EdgeInsets.only(right: 60, left: 60),

                          padding: EdgeInsets.all(6.0),
                          child: calc6.toString()=="-16750"
                              ? Text("Select Exam Date !!")
                              : (dur6!=Duration(days: 00, hours: 00, minutes: 00, seconds: 00)) ?
                          new InkWell(
                            child: Container(
                              //padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).buttonColor,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              //child: Text(remaining_days),
                              child: Expanded(
                                child: new Container(
                                  //margin: const EdgeInsets.all(0),
                                  //padding: EdgeInsets.only(left: 0, right: 0),
                                  child: !isTimer6 ? Icon(Icons.timer) : new SlideCountdownClock(duration: dur6,separator: ":"),

                                ),
                              ),
                            ),
                            onTap: ()
                            {
                              calc_days();
                              timer();
                              isTimer6=true;
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