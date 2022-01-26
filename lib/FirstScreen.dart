import 'package:academic_assistant/SubjectPage/SubjectPage1.dart';
import 'package:academic_assistant/SubjectPage/SubjectPage2.dart';
import 'package:academic_assistant/SubjectPage/SubjectPage3.dart';
import 'package:academic_assistant/SubjectPage/SubjectPage4.dart';
import 'package:academic_assistant/SubjectPage/SubjectPage5.dart';
import 'package:academic_assistant/SubjectPage/SubjectPage6.dart';
import 'package:academic_assistant/SubjectPage/SubjectPage7.dart';
import 'package:academic_assistant/SubjectPage/SubjectPage8.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstScreen extends StatefulWidget {
  @override
  State createState() => new _FirstScreen();
}
class _FirstScreen extends State<FirstScreen>  {
  var subtitle1="Subject 1",subtitle2="Subject 2",subtitle3="Subject 3",subtitle4="Subject 4",subtitle5="Subject 5",subtitle6="Subject 6",subtitle7="Subject 7",subtitle8="Subject 8";
  bool isEdit1=false,isEdit2=false,isEdit3=false,isEdit4=false,isEdit5=false,isEdit6=false,isEdit7=false,isEdit8=false;

  SharedPreferences prefs;

  initState() {
    super.initState();
    init();
  }

  void init() async{
    prefs = await SharedPreferences.getInstance();
    prefs.commit();
    subtitle1 = (prefs.getString('subtitle1') ?? "Subject 1");
    subtitle2 = (prefs.getString('subtitle2') ?? "Subject 2");
    subtitle3 = (prefs.getString('subtitle3') ?? "Subject 3");
    subtitle4 = (prefs.getString('subtitle4') ?? "Subject 4");
    subtitle5 = (prefs.getString('subtitle5') ?? "Subject 5");
    subtitle6 = (prefs.getString('subtitle6') ?? "Subject 6");
    subtitle7 = (prefs.getString('subtitle7') ?? "Subject 7");
    subtitle8 = (prefs.getString('subtitle8') ?? "Subject 8");

    setState(() {
      subtitle1;
      subtitle2;
      subtitle3;
      subtitle4;
      subtitle5;
      subtitle6;
      subtitle7;
      subtitle8;
    });
  }

  void sub1(value)
  {
    setState(() {
      subtitle1=value;
    });
    prefs.setString('subtitle1', subtitle1);
  }
  void sub2(value)
  {
    setState(() {
      subtitle2=value;
    });
    prefs.setString('subtitle2', subtitle2);
  }
  void sub3(value)
  {
    setState(() {
      subtitle3=value;
    });
    prefs.setString('subtitle3', subtitle3);
  }
  void sub4(value)
  {
    setState(() {
      subtitle4=value;
    });
    prefs.setString('subtitle4', subtitle4);
  }
  void sub5(value)
  {
    setState(() {
      subtitle5=value;
    });
    prefs.setString('subtitle5', subtitle5);
  }
  void sub6(value)
  {
    setState(() {
      subtitle6=value;
    });
    prefs.setString('subtitle6', subtitle6);
  }
  void sub7(value)
  {
    setState(() {
      subtitle7=value;
    });
    prefs.setString('subtitle7', subtitle7);
  }
  void sub8(value)
  {
    setState(() {
      subtitle8=value;
    });
    prefs.setString('subtitle8', subtitle8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body : SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.zero,
                  child: Center(
                      child: Column(
                        children: <Widget>[
                          new Padding(padding: EdgeInsets.all(20)),
                          Row(
                            children: [
                              Expanded(
                                child: !isEdit1 ? new ElevatedButton(
                                    child: new Text(subtitle1,
                                      style: TextStyle(
                                          color: Colors.white
                                      ),) ,
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.purple[800],
                                        onPrimary: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32.0),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                                        textStyle: TextStyle(
                                          fontSize: 17,
                                        )
                                    ),
                                    onPressed: (){
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => SubjectPage1(),),);

                                    }
                                ) : new TextFormField(
                                  //initialValue: title,
                                  // controller: numberone,
                                    autocorrect: true,
                                    //keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(hintText: 'Enter subject name',
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
                                    onFieldSubmitted: (value) {setState(() {
                                      isEdit1=false; subtitle1 = value; sub1(value);
                                    });}
                                ),
                              ),
                              new IconButton(icon: Icon(Icons.edit,color: Colors.purple[800],), onPressed: (){setState(() {
                                isEdit1=true;
                              });})
                            ],
                          ),
                          new Padding(padding: EdgeInsets.all(7)),
                          Row(
                            children: [
                              Expanded(
                                child: !isEdit2 ? new ElevatedButton(
                                    child: new Text(subtitle2,
                                      style: TextStyle(
                                          color: Colors.white
                                      ),) ,
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.purple[800],
                                        onPrimary: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32.0),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                                        textStyle: TextStyle(
                                          fontSize: 17,
                                        )
                                    ),
                                    onPressed: (){
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => SubjectPage2(),),);

                                    }
                                ) : new TextFormField(
                                  //initialValue: title,
                                  // controller: numberone,
                                    autocorrect: true,
                                    //keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(hintText: 'Enter subject name',
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
                                    onFieldSubmitted: (value) {setState(() {
                                      isEdit2=false; subtitle2 = value; sub2(value);
                                    });}
                                ),
                              ),
                              new IconButton(icon: Icon(Icons.edit,color: Colors.purple[800],), onPressed: (){setState(() {
                                isEdit2=true;
                              });})
                            ],
                          ),
                          new Padding(padding: EdgeInsets.all(7)),
                          Row(
                            children: [
                              Expanded(
                                child: !isEdit3 ? new ElevatedButton(
                                    child: new Text(subtitle3,
                                      style: TextStyle(
                                          color: Colors.white
                                      ),) ,
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.purple[800],
                                        onPrimary: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32.0),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                                        textStyle: TextStyle(
                                          fontSize: 17,
                                        )
                                    ),
                                    onPressed: (){
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => SubjectPage3(),),);

                                    }
                                ) : new TextFormField(
                                  //initialValue: title,
                                  // controller: numberone,
                                    autocorrect: true,
                                    //keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(hintText: 'Enter subject name',
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
                                    onFieldSubmitted: (value) {setState(() {
                                      isEdit3=false; subtitle3 = value; sub3(value);
                                    });}
                                ),
                              ),
                              new IconButton(icon: Icon(Icons.edit,color: Colors.purple[800],), onPressed: (){setState(() {
                                isEdit3=true;
                              });})
                            ],
                          ),
                          new Padding(padding: EdgeInsets.all(7)),
                          Row(
                            children: [
                              Expanded(
                                child: !isEdit4 ? new ElevatedButton(
                                    child: new Text(subtitle4,
                                      style: TextStyle(
                                          color: Colors.white
                                      ),) ,
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.purple[800],
                                        onPrimary: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32.0),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                                        textStyle: TextStyle(
                                          fontSize: 17,
                                        )
                                    ),
                                    onPressed: (){
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => SubjectPage4(),),);

                                    }
                                ) : new TextFormField(
                                  //initialValue: title,
                                  // controller: numberone,
                                    autocorrect: true,
                                    //keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(hintText: 'Enter subject name',
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
                                    onFieldSubmitted: (value) {setState(() {
                                      isEdit4=false; subtitle4 = value; sub4(value);
                                    });}
                                ),
                              ),
                              new IconButton(icon: Icon(Icons.edit,color: Colors.purple[800],), onPressed: (){setState(() {
                                isEdit4=true;
                              });})
                            ],
                          ),
                          new Padding(padding: EdgeInsets.all(7)),
                          Row(
                            children: [
                              Expanded(
                                child: !isEdit5 ? new ElevatedButton(
                                    child: new Text(subtitle5,
                                      style: TextStyle(
                                          color: Colors.white
                                      ),) ,
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.purple[800],
                                        onPrimary: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32.0),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                                        textStyle: TextStyle(
                                          fontSize: 17,
                                        )
                                    ),
                                    onPressed: (){
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => SubjectPage5(),),);

                                    }
                                ) : new TextFormField(
                                  //initialValue: title,
                                  // controller: numberone,
                                    autocorrect: true,
                                    //keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(hintText: 'Enter subject name',
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
                                    onFieldSubmitted: (value) {setState(() {
                                      isEdit5=false; subtitle5 = value; sub5(value);
                                    });}
                                ),
                              ),
                              new IconButton(icon: Icon(Icons.edit,color: Colors.purple[800],), onPressed: (){setState(() {
                                isEdit5=true;
                              });})
                            ],
                          ),
                          new Padding(padding: EdgeInsets.all(7)),
                          Row(
                            children: [
                              Expanded(
                                child: !isEdit6 ? new ElevatedButton(
                                    child: new Text(subtitle6,
                                      style: TextStyle(
                                          color: Colors.white
                                      ),) ,
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.purple[800],
                                        onPrimary: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32.0),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                                        textStyle: TextStyle(
                                          fontSize: 17,
                                        )
                                    ),
                                    onPressed: (){
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => SubjectPage6(),),);

                                    }
                                ) : new TextFormField(
                                  //initialValue: title,
                                  // controller: numberone,
                                    autocorrect: true,
                                    //keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(hintText: 'Enter subject name',
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
                                    onFieldSubmitted: (value) {setState(() {
                                      isEdit6=false; subtitle6 = value; sub6(value);
                                    });}
                                ),
                              ),
                              new IconButton(icon: Icon(Icons.edit,color: Colors.purple[800],), onPressed: (){setState(() {
                                isEdit6=true;
                              });})
                            ],
                          ),
                          new Padding(padding: EdgeInsets.all(7)),
                          Row(
                            children: [
                              Expanded(
                                child: !isEdit7 ? new ElevatedButton(
                                    child: new Text(subtitle7,
                                      style: TextStyle(
                                          color: Colors.white
                                      ),) ,
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.purple[800],
                                        onPrimary: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32.0),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                                        textStyle: TextStyle(
                                          fontSize: 17,
                                        )
                                    ),
                                    onPressed: (){
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => SubjectPage7(),),);

                                    }
                                ) : new TextFormField(
                                  //initialValue: title,
                                  // controller: numberone,
                                    autocorrect: true,
                                    //keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(hintText: 'Enter subject name',
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
                                    onFieldSubmitted: (value) {setState(() {
                                      isEdit7=false; subtitle7 = value; sub7(value);
                                    });}
                                ),
                              ),
                              new IconButton(icon: Icon(Icons.edit,color: Colors.purple[800],), onPressed: (){setState(() {
                                isEdit7=true;
                              });})
                            ],
                          ),
                          new Padding(padding: EdgeInsets.all(7)),
                          Row(
                            children: [
                              Expanded(
                                child: !isEdit8 ? new ElevatedButton(
                                    child: new Text(subtitle8,
                                      style: TextStyle(
                                          color: Colors.white
                                      ),) ,
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.purple[800],
                                        onPrimary: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32.0),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                                        textStyle: TextStyle(
                                          fontSize: 17,
                                        )
                                    ),
                                    onPressed: (){
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => SubjectPage8(),),);

                                    }
                                ) : new TextFormField(
                                  //initialValue: title,
                                  // controller: numberone,
                                    autocorrect: true,
                                    //keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(hintText: 'Enter subject name',
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
                                    onFieldSubmitted: (value) {setState(() {
                                      isEdit8=false; subtitle8 = value; sub8(value);
                                    });}
                                ),
                              ),
                              new IconButton(icon: Icon(Icons.edit,color: Colors.purple[800],), onPressed: (){setState(() {
                                isEdit8=true;
                              });})
                            ],
                          ),
                        ],
                      )
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
