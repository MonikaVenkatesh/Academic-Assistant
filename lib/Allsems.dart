import 'package:flutter/material.dart';
import 'package:editable/editable.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TimeTable",
      color: Colors.purple[800],
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: TablePage(),
    );
  }
}

class TablePage extends StatefulWidget {
  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {

  SharedPreferences prefs;
  static String data;
  static List<String> l=List.filled(40,"-",growable: true);
  static var i=0;

  initState() {
    super.initState();
    init();
  }

  void init() async{
    prefs = await SharedPreferences.getInstance();
    prefs.commit();
    l = (prefs.getStringList('l') ?? '-');
    i = (prefs.getInt('i') ?? 0);
    //data = (prefs.getString('data') ?? '');
    //afterPercent = (prefs.getDouble('afterPercent') ?? 0);
    setState(() {
      l;
      i;
    });

  }

  void save(list)
  {
    setState(() {
      //data=value;
      l=list;
      i++;
    });
    //prefs.setString('data', data);
    prefs.setStringList('l', l);
    prefs.setInt('i', i);
  }

  List rows = [
    {"Day": 'Mon', "1": l[0] ,"2":l[1], "3": l[2],"4": l[3],"5": l[4],"6": l[5],"7": l[6],"8":l[7]},
    {"Day": 'Tue', "1": l[8] ,"2":l[9], "3": l[10],"4": l[11],"5": l[12],"6": l[13],"7": l[14],"8":l[15]},
    {"Day": 'Wed', "1": l[16] ,"2":l[17], "3": l[18],"4": l[19],"5": l[20],"6": l[21],"7": l[22],"8":l[23]},
    {"Day": 'Thu', "1": l[24] ,"2":l[25], "3": l[26],"4": l[27],"5": l[28],"6": l[29],"7": l[30],"8":l[31]},
    {"Day": 'Fri', "1": l[32] ,"2":l[33], "3": l[34],"4": l[35],"5": l[36],"6": l[37],"7": l[38],"8":l[39]},
  ];
//Headers or Columns
  List headers = [
    {"title":'Day', 'index': 1, 'key':'Day'},
    {"title":'8.30-9.20', 'index': 2, 'key':'1'},
    {"title":'9.25-10.15', 'index': 3, 'key':'2'},
    {"title":'10.30-11.20', 'index': 4, 'key':'3'},
    {"title":'11.20-12.10', 'index': 5, 'key':'4'},
    {"title":'1.10-2', 'index': 6, 'key':'5'},
    {"title":'2.5-2.55', 'index': 7, 'key':'6'},
    {"title":'2.55-3.50', 'index': 8, 'key':'7'},
    {"title":'3.55-4.45', 'index': 9, 'key':'8'},


  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('TimeTable'),
        backgroundColor: Colors.purple[800],
      ),*/
      body: Editable(

        columns: headers,
        rows: rows,
        //showCreateButton: true,
        trHeight: 100,
        tdStyle: TextStyle(fontSize: 20),
        //showSaveIcon: true, //set true
        borderColor: Colors.grey.shade300,
        onSubmitted: (value){
          print(value);
          l[i]=value;
          save(l);
        },
        /*onRowSaved: (value){ //added line
          print(value); //prints to console
        },*/
      ),
    );
  }



}
