import 'package:flutter/material.dart';
import './HomePage.dart';
class ResultPage extends StatelessWidget{

  final double score;
  ResultPage(this.score);
  @override
  Widget build(BuildContext context){
    return  Material(
      color: Colors.deepOrange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Your CGPA is: ",style:  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40.0)),
          Text(score.toStringAsFixed(score.truncateToDouble() == score ? 0 : 2),
              style:  TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 50.0)),
          IconButton(
            icon:  Icon(Icons.restore,size: 30.0,),
            color: Colors.white,
            iconSize: 50.0,
            onPressed: ()=>Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(builder:(BuildContext context)=>new HomePage(0)), (Route route)=>route==null),
          )
        ],
      ),
    );
  }
}
