import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class LocalNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: new AppBar(

              title: new Text("Set Notification"),
              toolbarHeight: 80,
              backgroundColor: Colors.purple[800],
            ),
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
  var calc;
  int val;
  static Duration d = Duration(days: 00, hours: 00, minutes: 00, seconds: 00);
  static Duration dur;
  String task;


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

    scheduledTime = DateTime.now().add(Duration(days: calc));


    fltrNotification.schedule(
        1, "Remainder!", task , scheduledTime, generalNotificationDetails);
    AlertDialog alert = AlertDialog(
      //title: Text("My title"),
      content: Text("Notification set"),
      actions: [
        //okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void initdate() async{
    prefs = await SharedPreferences.getInstance();
    prefs.commit();
    calc = (prefs.getInt('calc') ?? 0);
    setState(() {
      calc;
    });

  }

  void set(DateTime curr)
  {
    setState(() {
      DateTime now=DateTime.now();
      _dateTime = curr;
      dur=_dateTime.difference(now);
      calc = _dateTime.difference(now).inDays +1;
    });
    prefs.setInt('calc', calc);
    // _showNotification();
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
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  //decoration: InputDecoration(border: OutlineInputBorder()),
                  decoration: InputDecoration(hintText: 'Enter task',
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
                  onChanged: (_val) {
                    task = _val;
                  },
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

                      Padding(padding: EdgeInsets.all(5)),
                      /*RaisedButton(
                        child: Text('Date'),
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
                      new ElevatedButton(
                          child: new Text("Date"),
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
                                lastDate: DateTime(2030)
                            ).then((date) {
                              setState(() {
                                set(date);
                              });
                            });
                          },
                      ),
                     /* RaisedButton(
                        onPressed: _showNotification,
                        child: new Text('Set Notification'),
                      ),*/
                      new ElevatedButton(
                          child: new Text("Set Notification"),
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
                          onPressed: (){_showNotification();}
                      )
                      //new SlideCountdownClock(duration: dur!=null ? dur :d),
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
        content: Text(task),
      ),
    );
  }
}