import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';




class TextFieldNumeric7 extends StatefulWidget {

  NumericTextFieldWidget7 createState() => NumericTextFieldWidget7();

}

class NumericTextFieldWidget7 extends State {

  SharedPreferences prefs7;
  FlutterLocalNotificationsPlugin fltrNotification7;
  DateTime _dateTime7;
  var calc7;
  int val7;
  int timestamp7;
  static Duration d7 = Duration(days: 00, hours: 00, minutes: 00, seconds: 00);
  static Duration dur7;

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
    var androidInitilize7 = new AndroidInitializationSettings('app_icon');
    var iOSinitilize7 = new IOSInitializationSettings();
    var initilizationsSettings7 =
    new InitializationSettings(androidInitilize7, iOSinitilize7);
    fltrNotification7 = new FlutterLocalNotificationsPlugin();
    fltrNotification7.initialize(initilizationsSettings7,
        onSelectNotification: notificationSelected);
    initdate();
    init();
  }
  Future _showNotification() async {
    var androidDetails7 = new AndroidNotificationDetails(
        "ID", "programmer", "channel",
        importance: Importance.Max);
    var iSODetails7 = new IOSNotificationDetails();
    var generalNotificationDetails7 =
    new NotificationDetails(androidDetails7, iSODetails7);

    var scheduledTime7;

    scheduledTime7 = DateTime.now().add(Duration(seconds: calc7));


    fltrNotification7.schedule(
        1, "You have an exam today", "All the Best!", scheduledTime7, generalNotificationDetails7);
  }

  void timer() {
    setState(() {
      DateTime dateTime7 = DateTime.fromMillisecondsSinceEpoch(timestamp7);
      DateTime now7=DateTime.now();
      dur7=_dateTime7.difference(now7);
    });

  }

  void initdate() async{
    prefs7 = await SharedPreferences.getInstance();
    prefs7.commit();
    calc7 = (prefs7.getInt('calc7') ?? 0);
    timestamp7 = (prefs7.getInt('timestamp7') ?? 0);
    setState(() {
      calc7;
      timestamp7;
    });

  }

  void set(DateTime curr)
  {
    setState(() {
      DateTime now7=DateTime.now();
      _dateTime7 = curr;
      timestamp7 = curr.millisecondsSinceEpoch;
      dur7=_dateTime7.difference(now7);
      calc7 = _dateTime7.difference(now7).inDays +1;
    });
    prefs7.setInt('calc7', calc7);
    prefs7.setInt('timestamp7', timestamp7);
    _showNotification();
  }

  void calc_days() {
    setState(() {
      DateTime dateTime7 = DateTime.fromMillisecondsSinceEpoch(timestamp7);
      set(dateTime7);
    });
  }


  final numberone7 = TextEditingController();
  final numbertwo7 = TextEditingController();
  String remaining_days7 = "How many days remaining??";
  String title7 = "marks";
  String title17 = "marks";
  String titlea17 = "Enter Assess 1 marks";
  String titlea27 = "Enter Assess 2 marks";
  String title27 = "Enter both fields";
  String title37 = "Set goal";
  String ss7;
  String og7 ='O';String aplusg7 ='A+'; String ag7 ='A'; String bplusg7 ='B+';String bg7 ='B';
  bool isEditable7=false;
  bool isEnabled7=false;
  bool isFull17 = false;
  bool isFull27 = false;
  bool isTimer7=false;
  bool goal_selected7 = false;
  double assessone7 = 0.0,assesstwo7=0.0,a7=0.0,b7=0.0,c7=0.0,remain7=50.0,remaing7=91.0;
  SharedPreferences pref7;
  bool userNameValidate7 = false;
  bool validateTextField(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        userNameValidate7 = true;
      });
      return false;
    }
    setState(() {
      userNameValidate7 = false;
    });
    return true;
  }

  void assign()
  {

    setState(() {
      assessone7 = double.parse(numberone7.text);
      titlea17 = assessone7.toString();
    });
    assign2();
    pref7.setDouble('assessone7', assessone7);
    pref7.setString('titlea17', titlea17);
  }
  void assign2(){

    setState(() {
      assesstwo7 = double.parse(numbertwo7.text);
      titlea27 = assesstwo7.toString();

      a7 = (assessone7 + assesstwo7)/2;
      b7= 50-a7;
      remain7 = b7*2;


      if(ss7 == og7)
      {
        remaing7 = (91-a7)*2;
      }
      if(ss7 == aplusg7)
      {
        remaing7 = (81-a7)*2;
      }
      if(ss7 == ag7)
      {
        remaing7 = (71-a7)*2;
      }
      if(ss7 == bplusg7)
      {
        remaing7 = (61-a7)*2;
      }


    });
    pref7.setString('ss7', ss7);
    pref7.setDouble('assesstwo7', assesstwo7);
    pref7.setDouble('remain7', remain7);
    pref7.setDouble('remaing7', remaing7);
    pref7.setString('titlea27', titlea27);

  }
  void init() async {
    pref7 = await SharedPreferences.getInstance();
    pref7.commit();
    assessone7 = (pref7.getDouble('assessone7') ?? 0);
    assesstwo7 = (pref7.getDouble('assesstwo7') ?? 0);
    remain7 = (pref7.getDouble('remain7') ?? 50);
    remaing7 = (pref7.getDouble('remaing7') ?? 91);
    ss7 = (pref7.getString('ss7') ?? "O");
    titlea17 = (pref7.getString('titlea17') ?? "Enter Assess 1 marks");
    titlea27 = (pref7.getString('titlea27') ?? "Enter Assess 2 marks");
    goal_selected7 =(pref7.getBool('goal_selected7') ?? false);
    isFull17 = (pref7.getBool('isFull17') ?? false);
    isFull27 = (pref7.getBool('isFull27') ?? false);
    setState(() {
      assessone7;
      assesstwo7;
      remain7;
      remaing7;
      ss7;
      titlea17;
      titlea27;
      goal_selected7;
      isFull17;
      isFull27;
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
                  value: ss7,
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
                      ss7 = _val;assign2();assign();goal_selected7=true;
                      pref7.setBool('goal_selected7', true);
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.edit,color: Colors.black),
                  onPressed: () {
                    setState(() => {
                      isEditable7 = true,
                    });
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(right: 80, left: 80),

                  padding: EdgeInsets.all(8.0),
                  child: !isEditable7
                      ? Text(titlea17)
                      : TextFormField(
                    //initialValue: title,
                      controller: numberone7,
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
                        setState(() => {validateTextField(numberone7.text),isEditable7 = false,isFull17=true, pref7.setBool('isFull17', true),titlea17 = value,assign()});
                      }),
                ),
                IconButton(
                  icon: Icon(Icons.edit,color: Colors.black),
                  onPressed: () {
                    setState(() => {
                      isEnabled7 = true,
                    });
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(right: 80, left: 80),

                  padding: EdgeInsets.all(8.0),
                  child: !isEnabled7
                      ? Text(titlea27)
                      : TextFormField(
                    //initialValue: title,
                      controller: numbertwo7,
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
                        setState(() => {isEnabled7 = false,isFull27=true,pref7.setBool('isFull27', true), titlea27 = value,assign2()});
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                ),
                Container(
                  child: (!isFull17 || !isFull27) ? Text(title27)
                      : new Text(

                      "\n\n should get $remain7 marks to pass"

                  ),

                ),

                Container(
                  child: (!goal_selected7) ? Text(title37)
                      : new Text(

                      "\nshould get $remaing7 marks to get to $ss7"

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
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Text(remaining_days7),
                          ),
                          onTap: () {
                            calc_days();
                            remaining_days7 = calc7.toString()=="-17750" ? "0" : calc7.toString();
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
                              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 7),
                              textStyle: TextStyle(
                                fontSize: 17,
                              )
                          ),

                          onPressed: () {
                            showDatePicker(
                                context: context,
                                initialDate: _dateTime7 == null ? DateTime.now() : _dateTime7,
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
                          margin: const EdgeInsets.only(right: 70, left: 70),

                          padding: EdgeInsets.all(7.0),
                          child: calc7.toString()=="-17750"
                              ? Text("Select Exam Date !!")
                              : (dur7!=Duration(days: 00, hours: 00, minutes: 00, seconds: 00)) ?
                          new InkWell(
                            child: Container(
                              //padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).buttonColor,
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              //child: Text(remaining_days),
                              child: Expanded(
                                child: new Container(
                                  //margin: const EdgeInsets.all(0),
                                  //padding: EdgeInsets.only(left: 0, right: 0),
                                  child: !isTimer7 ? Icon(Icons.timer) : new SlideCountdownClock(duration: dur7,separator: ":"),

                                ),
                              ),
                            ),
                            onTap: ()
                            {
                              calc_days();
                              timer();
                              isTimer7=true;
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