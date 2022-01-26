import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';




class TextFieldNumeric3 extends StatefulWidget {

  NumericTextFieldWidget3 createState() => NumericTextFieldWidget3();

}

class NumericTextFieldWidget3 extends State {

  SharedPreferences prefs3;
  FlutterLocalNotificationsPlugin fltrNotification3;
  DateTime _dateTime3;
  var calc3;
  int val3;
  int timestamp3;
  static Duration d3 = Duration(days: 00, hours: 00, minutes: 00, seconds: 00);
  static Duration dur3;

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
    var androidInitilize3 = new AndroidInitializationSettings('app_icon');
    var iOSinitilize3 = new IOSInitializationSettings();
    var initilizationsSettings3 =
    new InitializationSettings(androidInitilize3, iOSinitilize3);
    fltrNotification3 = new FlutterLocalNotificationsPlugin();
    fltrNotification3.initialize(initilizationsSettings3,
        onSelectNotification: notificationSelected);
    initdate();
    init();
  }
  Future _showNotification() async {
    var androidDetails3 = new AndroidNotificationDetails(
        "ID", "programmer", "channel",
        importance: Importance.Max);
    var iSODetails3 = new IOSNotificationDetails();
    var generalNotificationDetails3 =
    new NotificationDetails(androidDetails3, iSODetails3);

    var scheduledTime3;

    scheduledTime3 = DateTime.now().add(Duration(seconds: calc3));


    fltrNotification3.schedule(
        1, "You have an exam today", "All the Best!", scheduledTime3, generalNotificationDetails3);
  }

  void timer() {
    setState(() {
      DateTime dateTime3 = DateTime.fromMillisecondsSinceEpoch(timestamp3);
      DateTime now3=DateTime.now();
      dur3=_dateTime3.difference(now3);
    });

  }

  void initdate() async{
    prefs3 = await SharedPreferences.getInstance();
    prefs3.commit();
    calc3 = (prefs3.getInt('calc3') ?? 0);
    timestamp3 = (prefs3.getInt('timestamp3') ?? 0);
    setState(() {
      calc3;
      timestamp3;
    });

  }

  void set(DateTime curr)
  {
    setState(() {
      DateTime now3=DateTime.now();
      _dateTime3 = curr;
      timestamp3 = curr.millisecondsSinceEpoch;
      dur3=_dateTime3.difference(now3);
      calc3 = _dateTime3.difference(now3).inDays +1;
    });
    prefs3.setInt('calc3', calc3);
    prefs3.setInt('timestamp3', timestamp3);
    _showNotification();
  }

  void calc_days() {
    setState(() {
      DateTime dateTime3 = DateTime.fromMillisecondsSinceEpoch(timestamp3);
      set(dateTime3);
    });
  }


  final numberone3 = TextEditingController();
  final numbertwo3 = TextEditingController();
  String remaining_days3 = "How many days remaining??";
  String title3 = "marks";
  String title13 = "marks";
  String titlea13 = "Enter Assess 1 marks";
  String titlea23 = "Enter Assess 2 marks";
  String title23 = "Enter both fields";
  String title33 = "Set goal";
  String ss3;
  String og3 ='O';String aplusg3 ='A+'; String ag3 ='A'; String bplusg3 ='B+';String bg3 ='B';
  bool isEditable3=false;
  bool isEnabled3=false;
  bool isFull13 = false;
  bool isFull23 = false;
  bool isTimer3=false;
  bool goal_selected3 = false;
  double assessone3 = 0.0,assesstwo3=0.0,a3=0.0,b3=0.0,c3=0.0,remain3=50.0,remaing3=91.0;
  SharedPreferences pref3;
  bool userNameValidate3 = false;
  bool validateTextField(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        userNameValidate3 = true;
      });
      return false;
    }
    setState(() {
      userNameValidate3 = false;
    });
    return true;
  }

  void assign()
  {

    setState(() {
      assessone3 = double.parse(numberone3.text);
      titlea13 = assessone3.toString();
    });
    assign2();
    pref3.setDouble('assessone3', assessone3);
    pref3.setString('titlea13', titlea13);
  }
  void assign2(){

    setState(() {
      assesstwo3 = double.parse(numbertwo3.text);
      titlea23 = assesstwo3.toString();

      a3 = (assessone3 + assesstwo3)/2;
      b3= 50-a3;
      remain3 = b3*2;


      if(ss3 == og3)
      {
        remaing3 = (91-a3)*2;
      }
      if(ss3 == aplusg3)
      {
        remaing3 = (81-a3)*2;
      }
      if(ss3 == ag3)
      {
        remaing3 = (71-a3)*2;
      }
      if(ss3 == bplusg3)
      {
        remaing3 = (61-a3)*2;
      }


    });
    pref3.setString('ss3', ss3);
    pref3.setDouble('assesstwo3', assesstwo3);
    pref3.setDouble('remain3', remain3);
    pref3.setDouble('remaing3', remaing3);
    pref3.setString('titlea23', titlea23);

  }
  void init() async {
    pref3 = await SharedPreferences.getInstance();
    pref3.commit();
    assessone3 = (pref3.getDouble('assessone3') ?? 0);
    assesstwo3 = (pref3.getDouble('assesstwo3') ?? 0);
    remain3 = (pref3.getDouble('remain3') ?? 50);
    remaing3 = (pref3.getDouble('remaing3') ?? 91);
    ss3 = (pref3.getString('ss3') ?? "O");
    titlea13 = (pref3.getString('titlea13') ?? "Enter Assess 1 marks");
    titlea23 = (pref3.getString('titlea23') ?? "Enter Assess 2 marks");
    goal_selected3 =(pref3.getBool('goal_selected3') ?? false);
    isFull13 = (pref3.getBool('isFull13') ?? false);
    isFull23 = (pref3.getBool('isFull23') ?? false);
    setState(() {
      assessone3;
      assesstwo3;
      remain3;
      remaing3;
      ss3;
      titlea13;
      titlea23;
      goal_selected3;
      isFull13;
      isFull23;
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
                  value: ss3,
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
                      ss3 = _val;assign2();assign();goal_selected3=true;
                      pref3.setBool('goal_selected3', true);
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.edit,color: Colors.black),
                  onPressed: () {
                    setState(() => {
                      isEditable3 = true,
                    });
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(right: 80, left: 80),

                  padding: EdgeInsets.all(8.0),
                  child: !isEditable3
                      ? Text(titlea13)
                      : TextFormField(
                    //initialValue: title,
                      controller: numberone3,
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
                        setState(() => {validateTextField(numberone3.text),isEditable3 = false,isFull13=true, pref3.setBool('isFull13', true),titlea13 = value,assign()});
                      }),
                ),
                IconButton(
                  icon: Icon(Icons.edit,color: Colors.black),
                  onPressed: () {
                    setState(() => {
                      isEnabled3 = true,
                    });
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(right: 80, left: 80),

                  padding: EdgeInsets.all(8.0),
                  child: !isEnabled3
                      ? Text(titlea23)
                      : TextFormField(
                    //initialValue: title,
                      controller: numbertwo3,
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
                        setState(() => {isEnabled3 = false,isFull23=true,pref3.setBool('isFull23', true), titlea23 = value,assign2()});
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                ),
                Container(
                  child: (!isFull13 || !isFull23) ? Text(title23)
                      : new Text(

                      "\n\n should get $remain3 marks to pass"

                  ),

                ),

                Container(
                  child: (!goal_selected3) ? Text(title33)
                      : new Text(

                      "\nshould get $remaing3 marks to get to $ss3"

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
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            child: Text(remaining_days3),
                          ),
                          onTap: () {
                            calc_days();
                            remaining_days3 = calc3.toString()=="-13750" ? "0" : calc3.toString();
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
                              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 3),
                              textStyle: TextStyle(
                                fontSize: 17,
                              )
                          ),

                          onPressed: () {
                            showDatePicker(
                                context: context,
                                initialDate: _dateTime3 == null ? DateTime.now() : _dateTime3,
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
                          margin: const EdgeInsets.only(right: 30, left: 30),

                          padding: EdgeInsets.all(3.0),
                          child: calc3.toString()=="-13750"
                              ? Text("Select Exam Date !!")
                              : (dur3!=Duration(days: 00, hours: 00, minutes: 00, seconds: 00)) ?
                          new InkWell(
                            child: Container(
                              //padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).buttonColor,
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              //child: Text(remaining_days),
                              child: Expanded(
                                child: new Container(
                                  //margin: const EdgeInsets.all(0),
                                  //padding: EdgeInsets.only(left: 0, right: 0),
                                  child: !isTimer3 ? Icon(Icons.timer) : new SlideCountdownClock(duration: dur3,separator: ":"),

                                ),
                              ),
                            ),
                            onTap: ()
                            {
                              calc_days();
                              timer();
                              isTimer3=true;
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