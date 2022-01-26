import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';




class TextFieldNumeric4 extends StatefulWidget {

  NumericTextFieldWidget4 createState() => NumericTextFieldWidget4();

}

class NumericTextFieldWidget4 extends State {

  SharedPreferences prefs4;
  FlutterLocalNotificationsPlugin fltrNotification4;
  DateTime _dateTime4;
  var calc4;
  int val4;
  int timestamp4;
  static Duration d4 = Duration(days: 00, hours: 00, minutes: 00, seconds: 00);
  static Duration dur4;

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
    var androidInitilize4 = new AndroidInitializationSettings('app_icon');
    var iOSinitilize4 = new IOSInitializationSettings();
    var initilizationsSettings4 =
    new InitializationSettings(androidInitilize4, iOSinitilize4);
    fltrNotification4 = new FlutterLocalNotificationsPlugin();
    fltrNotification4.initialize(initilizationsSettings4,
        onSelectNotification: notificationSelected);
    initdate();
    init();
  }
  Future _showNotification() async {
    var androidDetails4 = new AndroidNotificationDetails(
        "ID", "programmer", "channel",
        importance: Importance.Max);
    var iSODetails4 = new IOSNotificationDetails();
    var generalNotificationDetails4 =
    new NotificationDetails(androidDetails4, iSODetails4);

    var scheduledTime4;

    scheduledTime4 = DateTime.now().add(Duration(seconds: calc4));


    fltrNotification4.schedule(
        1, "You have an exam today", "All the Best!", scheduledTime4, generalNotificationDetails4);
  }

  void timer() {
    setState(() {
      DateTime dateTime4 = DateTime.fromMillisecondsSinceEpoch(timestamp4);
      DateTime now4=DateTime.now();
      dur4=_dateTime4.difference(now4);
    });

  }

  void initdate() async{
    prefs4 = await SharedPreferences.getInstance();
    prefs4.commit();
    calc4 = (prefs4.getInt('calc4') ?? 0);
    timestamp4 = (prefs4.getInt('timestamp4') ?? 0);
    setState(() {
      calc4;
      timestamp4;
    });

  }

  void set(DateTime curr)
  {
    setState(() {
      DateTime now4=DateTime.now();
      _dateTime4 = curr;
      timestamp4 = curr.millisecondsSinceEpoch;
      dur4=_dateTime4.difference(now4);
      calc4 = _dateTime4.difference(now4).inDays +1;
    });
    prefs4.setInt('calc4', calc4);
    prefs4.setInt('timestamp4', timestamp4);
    _showNotification();
  }

  void calc_days() {
    setState(() {
      DateTime dateTime4 = DateTime.fromMillisecondsSinceEpoch(timestamp4);
      set(dateTime4);
    });
  }


  final numberone4 = TextEditingController();
  final numbertwo4 = TextEditingController();
  String remaining_days4 = "How many days remaining??";
  String title4 = "marks";
  String title14 = "marks";
  String titlea14 = "Enter Assess 1 marks";
  String titlea24 = "Enter Assess 2 marks";
  String title24 = "Enter both fields";
  String title34 = "Set goal";
  String ss4;
  String og4 ='O';String aplusg4 ='A+'; String ag4 ='A'; String bplusg4 ='B+';String bg4 ='B';
  bool isEditable4=false;
  bool isEnabled4=false;
  bool isFull14 = false;
  bool isFull24 = false;
  bool isTimer4=false;
  bool goal_selected4 = false;
  double assessone4 = 0.0,assesstwo4=0.0,a4=0.0,b4=0.0,c4=0.0,remain4=50.0,remaing4=91.0;
  SharedPreferences pref4;
  bool userNameValidate4 = false;
  bool validateTextField(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        userNameValidate4 = true;
      });
      return false;
    }
    setState(() {
      userNameValidate4 = false;
    });
    return true;
  }

  void assign()
  {

    setState(() {
      assessone4 = double.parse(numberone4.text);
      titlea14 = assessone4.toString();
    });
    assign2();
    pref4.setDouble('assessone4', assessone4);
    pref4.setString('titlea14', titlea14);
  }
  void assign2(){

    setState(() {
      assesstwo4 = double.parse(numbertwo4.text);
      titlea24 = assesstwo4.toString();

      a4 = (assessone4 + assesstwo4)/2;
      b4= 50-a4;
      remain4 = b4*2;


      if(ss4 == og4)
      {
        remaing4 = (91-a4)*2;
      }
      if(ss4 == aplusg4)
      {
        remaing4 = (81-a4)*2;
      }
      if(ss4 == ag4)
      {
        remaing4 = (71-a4)*2;
      }
      if(ss4 == bplusg4)
      {
        remaing4 = (61-a4)*2;
      }


    });
    pref4.setString('ss4', ss4);
    pref4.setDouble('assesstwo4', assesstwo4);
    pref4.setDouble('remain4', remain4);
    pref4.setDouble('remaing4', remaing4);
    pref4.setString('titlea24', titlea24);

  }
  void init() async {
    pref4 = await SharedPreferences.getInstance();
    pref4.commit();
    assessone4 = (pref4.getDouble('assessone4') ?? 0);
    assesstwo4 = (pref4.getDouble('assesstwo4') ?? 0);
    remain4 = (pref4.getDouble('remain4') ?? 50);
    remaing4 = (pref4.getDouble('remaing4') ?? 91);
    ss4 = (pref4.getString('ss4') ?? "O");
    titlea14 = (pref4.getString('titlea14') ?? "Enter Assess 1 marks");
    titlea24 = (pref4.getString('titlea24') ?? "Enter Assess 2 marks");
    goal_selected4 =(pref4.getBool('goal_selected4') ?? false);
    isFull14 = (pref4.getBool('isFull14') ?? false);
    isFull24 = (pref4.getBool('isFull24') ?? false);
    setState(() {
      assessone4;
      assesstwo4;
      remain4;
      remaing4;
      ss4;
      titlea14;
      titlea24;
      goal_selected4;
      isFull14;
      isFull24;
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
                  value: ss4,
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
                      ss4 = _val;assign2();assign();goal_selected4=true;
                      pref4.setBool('goal_selected4', true);
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.edit,color: Colors.black),
                  onPressed: () {
                    setState(() => {
                      isEditable4 = true,
                    });
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(right: 80, left: 80),

                  padding: EdgeInsets.all(8.0),
                  child: !isEditable4
                      ? Text(titlea14)
                      : TextFormField(
                    //initialValue: title,
                      controller: numberone4,
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
                        setState(() => {validateTextField(numberone4.text),isEditable4 = false,isFull14=true, pref4.setBool('isFull14', true),titlea14 = value,assign()});
                      }),
                ),
                IconButton(
                  icon: Icon(Icons.edit,color: Colors.black),
                  onPressed: () {
                    setState(() => {
                      isEnabled4 = true,
                    });
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(right: 80, left: 80),

                  padding: EdgeInsets.all(4.0),
                  child: !isEnabled4
                      ? Text(titlea24)
                      : TextFormField(
                    //initialValue: title,
                      controller: numbertwo4,
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
                        setState(() => {isEnabled4 = false,isFull24=true,pref4.setBool('isFull24', true), titlea24 = value,assign2()});
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                ),
                Container(
                  child: (!isFull14 || !isFull24) ? Text(title24)
                      : new Text(

                      "\n\n should get $remain4 marks to pass"

                  ),

                ),

                Container(
                  child: (!goal_selected4) ? Text(title34)
                      : new Text(

                      "\nshould get $remaing4 marks to get to $ss4"

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
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text(remaining_days4),
                          ),
                          onTap: () {
                            calc_days();
                            remaining_days4 = calc4.toString()=="-14750" ? "0" : calc4.toString();
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
                              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 4),
                              textStyle: TextStyle(
                                fontSize: 17,
                              )
                          ),

                          onPressed: () {
                            showDatePicker(
                                context: context,
                                initialDate: _dateTime4 == null ? DateTime.now() : _dateTime4,
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
                          margin: const EdgeInsets.only(right: 40, left: 40),

                          padding: EdgeInsets.all(4.0),
                          child: calc4.toString()=="-14750"
                              ? Text("Select Exam Date !!")
                              : (dur4!=Duration(days: 00, hours: 00, minutes: 00, seconds: 00)) ?
                          new InkWell(
                            child: Container(
                              //padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).buttonColor,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              //child: Text(remaining_days),
                              child: Expanded(
                                child: new Container(
                                  //margin: const EdgeInsets.all(0),
                                  //padding: EdgeInsets.only(left: 0, right: 0),
                                  child: !isTimer4 ? Icon(Icons.timer) : new SlideCountdownClock(duration: dur4,separator: ":"),

                                ),
                              ),
                            ),
                            onTap: ()
                            {
                              calc_days();
                              timer();
                              isTimer4=true;
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