import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';




class TextFieldNumeric5 extends StatefulWidget {

  NumericTextFieldWidget5 createState() => NumericTextFieldWidget5();

}

class NumericTextFieldWidget5 extends State {

  SharedPreferences prefs5;
  FlutterLocalNotificationsPlugin fltrNotification5;
  DateTime _dateTime5;
  var calc5;
  int val5;
  int timestamp5;
  static Duration d5 = Duration(days: 00, hours: 00, minutes: 00, seconds: 00);
  static Duration dur5;

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
    var androidInitilize5 = new AndroidInitializationSettings('app_icon');
    var iOSinitilize5 = new IOSInitializationSettings();
    var initilizationsSettings5 =
    new InitializationSettings(androidInitilize5, iOSinitilize5);
    fltrNotification5 = new FlutterLocalNotificationsPlugin();
    fltrNotification5.initialize(initilizationsSettings5,
        onSelectNotification: notificationSelected);
    initdate();
    init();
  }
  Future _showNotification() async {
    var androidDetails5 = new AndroidNotificationDetails(
        "ID", "programmer", "channel",
        importance: Importance.Max);
    var iSODetails5 = new IOSNotificationDetails();
    var generalNotificationDetails5 =
    new NotificationDetails(androidDetails5, iSODetails5);

    var scheduledTime5;

    scheduledTime5 = DateTime.now().add(Duration(seconds: calc5));


    fltrNotification5.schedule(
        1, "You have an exam today", "All the Best!", scheduledTime5, generalNotificationDetails5);
  }

  void timer() {
    setState(() {
      DateTime dateTime5 = DateTime.fromMillisecondsSinceEpoch(timestamp5);
      DateTime now5=DateTime.now();
      dur5=_dateTime5.difference(now5);
    });

  }

  void initdate() async{
    prefs5 = await SharedPreferences.getInstance();
    prefs5.commit();
    calc5 = (prefs5.getInt('calc5') ?? 0);
    timestamp5 = (prefs5.getInt('timestamp5') ?? 0);
    setState(() {
      calc5;
      timestamp5;
    });

  }

  void set(DateTime curr)
  {
    setState(() {
      DateTime now5=DateTime.now();
      _dateTime5 = curr;
      timestamp5 = curr.millisecondsSinceEpoch;
      dur5=_dateTime5.difference(now5);
      calc5 = _dateTime5.difference(now5).inDays +1;
    });
    prefs5.setInt('calc5', calc5);
    prefs5.setInt('timestamp5', timestamp5);
    _showNotification();
  }

  void calc_days() {
    setState(() {
      DateTime dateTime5 = DateTime.fromMillisecondsSinceEpoch(timestamp5);
      set(dateTime5);
    });
  }


  final numberone5 = TextEditingController();
  final numbertwo5 = TextEditingController();
  String remaining_days5 = "How many days remaining??";
  String title5 = "marks";
  String title15 = "marks";
  String titlea15 = "Enter Assess 1 marks";
  String titlea25 = "Enter Assess 2 marks";
  String title25 = "Enter both fields";
  String title35 = "Set goal";
  String ss5;
  String og5 ='O';String aplusg5 ='A+'; String ag5 ='A'; String bplusg5 ='B+';String bg5 ='B';
  bool isEditable5=false;
  bool isEnabled5=false;
  bool isFull15 = false;
  bool isFull25 = false;
  bool isTimer5=false;
  bool goal_selected5 = false;
  double assessone5 = 0.0,assesstwo5=0.0,a5=0.0,b5=0.0,c5=0.0,remain5=50.0,remaing5=91.0;
  SharedPreferences pref5;
  bool userNameValidate5 = false;
  bool validateTextField(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        userNameValidate5 = true;
      });
      return false;
    }
    setState(() {
      userNameValidate5 = false;
    });
    return true;
  }

  void assign()
  {

    setState(() {
      assessone5 = double.parse(numberone5.text);
      titlea15 = assessone5.toString();
    });
    assign2();
    pref5.setDouble('assessone5', assessone5);
    pref5.setString('titlea15', titlea15);
  }
  void assign2(){

    setState(() {
      assesstwo5 = double.parse(numbertwo5.text);
      titlea25 = assesstwo5.toString();

      a5 = (assessone5 + assesstwo5)/2;
      b5= 50-a5;
      remain5 = b5*2;


      if(ss5 == og5)
      {
        remaing5 = (91-a5)*2;
      }
      if(ss5 == aplusg5)
      {
        remaing5 = (81-a5)*2;
      }
      if(ss5 == ag5)
      {
        remaing5 = (71-a5)*2;
      }
      if(ss5 == bplusg5)
      {
        remaing5 = (61-a5)*2;
      }


    });
    pref5.setString('ss5', ss5);
    pref5.setDouble('assesstwo5', assesstwo5);
    pref5.setDouble('remain5', remain5);
    pref5.setDouble('remaing5', remaing5);
    pref5.setString('titlea25', titlea25);

  }
  void init() async {
    pref5 = await SharedPreferences.getInstance();
    pref5.commit();
    assessone5 = (pref5.getDouble('assessone5') ?? 0);
    assesstwo5 = (pref5.getDouble('assesstwo5') ?? 0);
    remain5 = (pref5.getDouble('remain5') ?? 50);
    remaing5 = (pref5.getDouble('remaing5') ?? 91);
    ss5 = (pref5.getString('ss5') ?? "O");
    titlea15 = (pref5.getString('titlea15') ?? "Enter Assess 1 marks");
    titlea25 = (pref5.getString('titlea25') ?? "Enter Assess 2 marks");
    goal_selected5 =(pref5.getBool('goal_selected5') ?? false);
    isFull15 = (pref5.getBool('isFull15') ?? false);
    isFull25 = (pref5.getBool('isFull25') ?? false);
    setState(() {
      assessone5;
      assesstwo5;
      remain5;
      remaing5;
      ss5;
      titlea15;
      titlea25;
      goal_selected5;
      isFull15;
      isFull25;
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
                  value: ss5,
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
                      ss5 = _val;assign2();assign();goal_selected5=true;
                      pref5.setBool('goal_selected5', true);
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.edit,color: Colors.black),
                  onPressed: () {
                    setState(() => {
                      isEditable5 = true,
                    });
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(right: 80, left: 80),

                  padding: EdgeInsets.all(8.0),
                  child: !isEditable5
                      ? Text(titlea15)
                      : TextFormField(
                    //initialValue: title,
                      controller: numberone5,
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
                        setState(() => {validateTextField(numberone5.text),isEditable5 = false,isFull15=true, pref5.setBool('isFull15', true),titlea15 = value,assign()});
                      }),
                ),
                IconButton(
                  icon: Icon(Icons.edit,color: Colors.black),
                  onPressed: () {
                    setState(() => {
                      isEnabled5 = true,
                    });
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(right: 80, left: 80),

                  padding: EdgeInsets.all(8.0),
                  child: !isEnabled5
                      ? Text(titlea25)
                      : TextFormField(
                    //initialValue: title,
                      controller: numbertwo5,
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
                        setState(() => {isEnabled5 = false,isFull25=true,pref5.setBool('isFull25', true), titlea25 = value,assign2()});
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                ),
                Container(
                  child: (!isFull15 || !isFull25) ? Text(title25)
                      : new Text(

                      "\n\n should get $remain5 marks to pass"

                  ),

                ),

                Container(
                  child: (!goal_selected5) ? Text(title35)
                      : new Text(

                      "\nshould get $remaing5 marks to get to $ss5"

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
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(remaining_days5),
                          ),
                          onTap: () {
                            calc_days();
                            remaining_days5 = calc5.toString()=="-15750" ? "0" : calc5.toString();
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
                              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                              textStyle: TextStyle(
                                fontSize: 17,
                              )
                          ),

                          onPressed: () {
                            showDatePicker(
                                context: context,
                                initialDate: _dateTime5 == null ? DateTime.now() : _dateTime5,
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
                          margin: const EdgeInsets.only(right: 50, left: 50),

                          padding: EdgeInsets.all(5.0),
                          child: calc5.toString()=="-15750"
                              ? Text("Select Exam Date !!")
                              : (dur5!=Duration(days: 00, hours: 00, minutes: 00, seconds: 00)) ?
                          new InkWell(
                            child: Container(
                              //padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).buttonColor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              //child: Text(remaining_days),
                              child: Expanded(
                                child: new Container(
                                  //margin: const EdgeInsets.all(0),
                                  //padding: EdgeInsets.only(left: 0, right: 0),
                                  child: !isTimer5 ? Icon(Icons.timer) : new SlideCountdownClock(duration: dur5,separator: ":"),

                                ),
                              ),
                            ),
                            onTap: ()
                            {
                              calc_days();
                              timer();
                              isTimer5=true;
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