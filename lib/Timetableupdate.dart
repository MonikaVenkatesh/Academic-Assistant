import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Timetableupdate extends StatefulWidget {
  @override
  State createState() => new update();
}

class update extends State<Timetableupdate> {

  SharedPreferences prefs;
  final TextEditingController t1 = new TextEditingController();
  String day;
  bool daySelected,isEditable;
  String m1="-",m2="-",m3="-",m4="-",m5="-",m6="-",m7="-",m8="-";

  initState() {
    super.initState();
    init();
  }

  void init() async{
    prefs = await SharedPreferences.getInstance();
    prefs.commit();
    m1 = (prefs.getString('m1') ?? "-");
    //res = last - 1;
    setState(() {
      m1;
    });

  }

  void first() {
    setState(() {
      m1 = t1.text;
    });
    prefs.setString('m1', m1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            DropdownButton(
            value: day,
            items: [
              DropdownMenuItem(
                child: Text("Monday"),
                value: "1",
              ),
              DropdownMenuItem(
                child: Text("Tuesday"),
                value: "2",
              ),
              DropdownMenuItem(
                child: Text("Wednesday"),
                value: "3",
              ),
              DropdownMenuItem(
                child: Text("Thursday"),
                value: "4",
              ),
              DropdownMenuItem(
                child: Text("Friday"),
                value: "5",
              ),
            ],
            hint: Text(
              "Choose day",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onChanged: (_val) {
              setState(() {
                day = _val;daySelected=true;
                prefs.setBool('daySelected', true);
              });
            },
          ),

              TextFormField(
                //initialValue: ,
                  controller: t1,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(hintText: 'Number of classes',
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
                    setState(() => {isEditable = false, m1 = value,first()});
                  }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: (){
      Navigator.pop(context);
    },
    child: const Icon(Icons.edit),
    backgroundColor: Colors.purple[800],
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

}