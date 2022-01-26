import 'package:academic_assistant/Timetableupdate.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

/// This is the main application widget.
class Timetable1 extends StatefulWidget {
  @override
  State createState() => new table();
}

class table extends State<Timetable1> {
  //MyStatelessWidget({Key key}) : super(key: key);
  @override


  SharedPreferences prefs;
  String day;
  bool daySelected,isEditable;
  String m1="-",m2="-",m3="-",m4="-",m5="-",m6="-",m7="-",m8="-",t1="-",t2="-",t3="-",t4="-",t5="-",t6="-",t7="-",t8="-",w1="-",w2="-",w3="-",w4="-",w5="-",w6="-",w7="-",w8="-",th1="-",th2="-",th3="-",th4="-",th5="-",th6="-",th7="-",th8="-",f1="-",f2="-",f3="-",f4="-",f5="-",f6="-",f7="-",f8="-";
  String p1,p2,p3,p4,p5,p6,p7,p8;

  initState() {
    super.initState();
    init();
  }

  void init() async{
    prefs = await SharedPreferences.getInstance();
    prefs.commit();
    m1 = (prefs.getString('m1') ?? "-");
    m2 = (prefs.getString('m2') ?? "-");
    m3 = (prefs.getString('m3') ?? "-");
    m4 = (prefs.getString('m4') ?? "-");
    m5 = (prefs.getString('m5') ?? "-");
    m6 = (prefs.getString('m6') ?? "-");
    m7 = (prefs.getString('m7') ?? "-");
    m8 = (prefs.getString('m8') ?? "-");
    t1 = (prefs.getString('t1') ?? "-");
    t2 = (prefs.getString('t2') ?? "-");
    t3 = (prefs.getString('t3') ?? "-");
    t4 = (prefs.getString('t4') ?? "-");
    t5 = (prefs.getString('t5') ?? "-");
    t6 = (prefs.getString('t6') ?? "-");
    t7 = (prefs.getString('t7') ?? "-");
    t8 = (prefs.getString('t8') ?? "-");
    w1 = (prefs.getString('w1') ?? "-");
    w2 = (prefs.getString('w2') ?? "-");
    w3 = (prefs.getString('w3') ?? "-");
    w4 = (prefs.getString('w4') ?? "-");
    w5 = (prefs.getString('w5') ?? "-");
    w6 = (prefs.getString('w6') ?? "-");
    w7 = (prefs.getString('w7') ?? "-");
    w8 = (prefs.getString('w8') ?? "-");
    th1 = (prefs.getString('th1') ?? "-");
    th2 = (prefs.getString('th2') ?? "-");
    th3 = (prefs.getString('th3') ?? "-");
    th4 = (prefs.getString('th4') ?? "-");
    th5 = (prefs.getString('th5') ?? "-");
    th6 = (prefs.getString('th6') ?? "-");
    th7 = (prefs.getString('th7') ?? "-");
    th8 = (prefs.getString('th8') ?? "-");
    f1 = (prefs.getString('f1') ?? "-");
    f2 = (prefs.getString('f2') ?? "-");
    f3 = (prefs.getString('f3') ?? "-");
    f4 = (prefs.getString('f4') ?? "-");
    f5 = (prefs.getString('f5') ?? "-");
    f6 = (prefs.getString('f6') ?? "-");
    f7 = (prefs.getString('f7') ?? "-");
    f8 = (prefs.getString('f8') ?? "-");
    setState(() {
      m1;
      m2;
      m3;
      m4;
      m5;
      m6;
      m7;
      m8;
      t1;t2;t3;t4;t5;t6;t7;t8;
      w1;w2;w3;w4;w5;w6;w7;w8;
      th1;th2;th3;th4;th5;th6;th7;th8;
      f1;f2;f3;f4;f5;f6;f7;f8;

    });

  }

  void first() {
    setState(() {
      m1=p1;
      m2=p2;
      m3=p3;
      m4=p4;
      m5=p5;
      m6=p6;
      m7=p7;
      m8=p8;
    });
    prefs.setString('m1', m1);
    prefs.setString('m2', m2);
    prefs.setString('m3', m3);
    prefs.setString('m4', m4);
    prefs.setString('m5', m5);
    prefs.setString('m6', m6);
    prefs.setString('m7', m7);
    prefs.setString('m8', m8);
  }

  void second() {
    setState(() {
      t1=p1;
      t2=p2;
      t3=p3;
      t4=p4;
      t5=p5;
      t6=p6;
      t7=p7;
      t8=p8;
    });
    prefs.setString('t1', t1);
    prefs.setString('t2', t2);
    prefs.setString('t3', t3);
    prefs.setString('t4', t4);
    prefs.setString('t5', t5);
    prefs.setString('t6', t6);
    prefs.setString('t7', t7);
    prefs.setString('t8', t8);
  }

  void third() {
    setState(() {
      w1=p1;
      w2=p2;
      w3=p3;
      w4=p4;
      w5=p5;
      w6=p6;
      w7=p7;
      w8=p8;
    });
    prefs.setString('w1', w1);
    prefs.setString('w2', w2);
    prefs.setString('w3', w3);
    prefs.setString('w4', w4);
    prefs.setString('w5', w5);
    prefs.setString('w6', w6);
    prefs.setString('w7', w7);
    prefs.setString('w8', w8);
  }

  void fourth() {
    setState(() {
      th1=p1;
      th2=p2;
      th3=p3;
      th4=p4;
      th5=p5;
      th6=p6;
      th7=p7;
      th8=p8;
    });
    prefs.setString('th1', th1);
    prefs.setString('th2', th2);
    prefs.setString('th3', th3);
    prefs.setString('th4', th4);
    prefs.setString('th5', th5);
    prefs.setString('th6', th6);
    prefs.setString('th7', th7);
    prefs.setString('th8', th8);
  }

  void fifth() {
    setState(() {
      f1=p1;
      f2=p2;
      f3=p3;
      f4=p4;
      f5=p5;
      f6=p6;
      f7=p7;
      f8=p8;
    });
    prefs.setString('f1', f1);
    prefs.setString('f2', f2);
    prefs.setString('f3', f3);
    prefs.setString('f4', f4);
    prefs.setString('f5', f5);
    prefs.setString('f6', f6);
    prefs.setString('f7', f7);
    prefs.setString('f8', f8);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body:Column(
          children: [
            Padding(padding: EdgeInsets.all(30)),
            Text(
              "Timetable",
              style: GoogleFonts.openSans(fontSize: 30,fontWeight: FontWeight.bold),
              //TextStyle(fontWeight: FontWeight.bold,color: Colors.purple[800],fontSize: 40),
            ),
            Padding(padding: EdgeInsets.all(25)),
            SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Day',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  '1',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  '2',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  '3',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  '4',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  '5',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  '6',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  '7',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  '8',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),

            ],
            rows: <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Monday')),
                  DataCell(Text('$m1')),
                  DataCell(Text('$m2')),
                  DataCell(Text('$m3')),
                  DataCell(Text('$m4')),
                  DataCell(Text('$m5')),
                  DataCell(Text('$m6')),
                  DataCell(Text('$m7')),
                  DataCell(Text('$m8')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Tuesday')),
                  DataCell(Text('$t1')),
                  DataCell(Text('$t2')),
                  DataCell(Text('$t3')),
                  DataCell(Text('$t4')),
                  DataCell(Text('$t5')),
                  DataCell(Text('$t6')),
                  DataCell(Text('$t7')),
                  DataCell(Text('$t8')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Wednesday')),
                  DataCell(Text('$w1')),
                  DataCell(Text('$w2')),
                  DataCell(Text('$w3')),
                  DataCell(Text('$w4')),
                  DataCell(Text('$w5')),
                  DataCell(Text('$w6')),
                  DataCell(Text('$w7')),
                  DataCell(Text('$w8')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Thursday')),
                  DataCell(Text('$th1')),
                  DataCell(Text('$th2')),
                  DataCell(Text('$th3')),
                  DataCell(Text('$th4')),
                  DataCell(Text('$th5')),
                  DataCell(Text('$th6')),
                  DataCell(Text('$th7')),
                  DataCell(Text('$th8')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Friday')),
                  DataCell(Text('$f1')),
                  DataCell(Text('$f2')),
                  DataCell(Text('$f3')),
                  DataCell(Text('$f4')),
                  DataCell(Text('$f5')),
                  DataCell(Text('$f6')),
                  DataCell(Text('$f7')),
                  DataCell(Text('$f8')),
                ],
              ),
            ],
      ),
    ),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title:  Text('Must choose day at last'),
            content:  SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: '1st period',
                        ),
                        onChanged: (value){
                          setState(() {
                            p1=value;
                          });
                        }
                      ),
                      TextFormField(
                          decoration: InputDecoration(
                            labelText: '2nd period',
                          ),
                          onChanged: (value){
                            setState(() {
                              p2=value;
                            });
                          }
                      ),
                      TextFormField(
                          decoration: InputDecoration(
                            labelText: '3rd period',
                          ),
                          onChanged: (value){
                            setState(() {
                              p3=value;
                            });
                          }
                      ),
                      TextFormField(
                          decoration: InputDecoration(
                            labelText: '4th period',
                          ),
                          onChanged: (value){
                            setState(() {
                              p4=value;
                            });
                          }
                      ),
                      TextFormField(
                          decoration: InputDecoration(
                            labelText: '5th period',
                          ),
                          onChanged: (value){
                            setState(() {
                              p5=value;
                            });
                          }
                      ),
                      TextFormField(
                          decoration: InputDecoration(
                            labelText: '6th period',
                          ),
                          onChanged: (value){
                            setState(() {
                              p6=value;
                            });
                          }
                      ),
                      TextFormField(
                          decoration: InputDecoration(
                            labelText: '7th period',
                          ),
                          onChanged: (value){
                            setState(() {
                              p7=value;
                            });
                          }
                      ),
                      TextFormField(
                          decoration: InputDecoration(
                            labelText: '8th period',
                          ),
                          onChanged: (value){
                            setState(() {
                              p8=value;
                            });
                          }
                      ),
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
                            if(day=="1") first();
                            if(day=="2") second();
                            if(day=="3") third();
                            if(day=="4") fourth();
                            if(day=="5") fifth();
                          });
                        },
                      ),
                      Text("\nFill all fields for selected day"),
                    ],
                  ),
                ),
              ),
            ),

            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'UPDATE'),
                child:  Text('UPDATE',style: TextStyle(color: Colors.purple[800]),),
              ),
            ],
          ),
        ),

          //Navigator.push(context,MaterialPageRoute(builder: (context) => Timetableupdate(),),);

        child: const Icon(Icons.edit),
        backgroundColor: Colors.purple[800],
    ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

}