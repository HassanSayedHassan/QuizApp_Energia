import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:materialdesign/Splash.dart';
import 'package:materialdesign/showResults.dart';
void main() {
  runApp(MyApp());
}

var finalScore = 0;
var questionNumber = 0;
var quiz = new QuizDAta();

class QuizDAta{

  var questions = [
    "how many days in a week?",
    "How many fingers on the hand? ?",
    "How many months of the year? ?",
    "A nocturnal animal with some really big eyes",
  ];


  var choices = [
    ["4", "5", "7", "6"],
    ["4", "2", "5", "3"],
    ["15", "12", "13", "14"],
    ["Spider", "Snake", "Hawk", "Owl"]
  ];


  var correctAnswers = [
    "7", "5", "12", "Owl"
  ];
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz APP',
      theme: ThemeData(

      ),
      home: Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {



  @override
  State<StatefulWidget> createState() {
      return _MyHomePageState();
  }

}

class _MyHomePageState extends State<MyHomePage> {


  bool disableAnswer = true;
  Color app=Color(0xff212d65);
  var color_index=0;
  var btncolor = [Color(0xff212d65),Colors.green,Colors.red,Colors.amberAccent];

  Map<String, Color> mapcolors = {
    "a":Color(0xff212d65),
    "b":Color(0xff212d65),
    "c": Color(0xff212d65),
    "d": Color(0xff212d65),
  };
    // Colors.red,




  @override
  void initState(){
    super.initState();

    Zeros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: btncolor[0],
        elevation:0,
        title: Text('Quiz APP',
        ),
        centerTitle: true,
      ),

      body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             Image.asset("images/ep.jpg",width: 60,height: 60,),
              Image.asset("images/ep.jpg",width: 60,height: 60,)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(' Q : ${questionNumber+1} / ${quiz.questions.length}',style: TextStyle(fontSize: 20),),
              Text('Score : ${finalScore}',style: TextStyle(fontSize: 20),)
            ],
          ),
        ),
         Container(
        //
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(100.0),
           //    border: Border.all(color: Colors.blueAccent),
             color: btncolor[0],
           ),
             margin: EdgeInsets.only(top: 30),
             width: double.infinity,
             padding: EdgeInsets.all(20),
                    child: Text('${quiz.questions[questionNumber]}',
                      style: TextStyle(fontSize: 20,
                        color: Colors.white
                      ),

                    ),



        ),
        answerbtn( '${quiz.choices[questionNumber][0]}',0,'a'),
        answerbtn( '${quiz.choices[questionNumber][1]}',1,'b'),
        answerbtn( '${quiz.choices[questionNumber][2]}',2,'c'),
        answerbtn( '${quiz.choices[questionNumber][3]}',3,'d'),



    ],



      ),

    );
  }


 Container answerbtn(String text,int index,String ind){
    return  Container(
      padding: EdgeInsets.only(top: 5,bottom: 5),
      margin: EdgeInsets.only(top: 10),
      width: 250,
      child: RaisedButton(
        shape: StadiumBorder(),
        color: mapcolors[ind],
        padding: EdgeInsets.only(top: 10,bottom: 10),
        onPressed: (){
          if (disableAnswer==true){
            setState(() {
              mapcolors[ind]=btncolor[3];
              disableAnswer=false;
            });
            Timer(Duration(seconds: 1), ()
            {
              if (quiz.choices[questionNumber][index] ==
                  quiz.correctAnswers[questionNumber]) {
                debugPrint("Correct");
                setState(() {
                  mapcolors[ind]=btncolor[1];
                });

                finalScore++;
                Timer(Duration(seconds: 1), (){ updateQuestion();   setState(() {  disableAnswer=true; });});
              } else {
                debugPrint("Wrong");
                setState(() {
                  mapcolors[ind]=btncolor[2];
                });
                Timer(Duration(seconds: 1), (){ updateQuestion();   setState(() {  disableAnswer=true; });});
              }

            });
          }
          else {
            return null;
          }

             },
        child: Text(text,style: TextStyle(fontSize: 20,color: Colors.white),),


      ),
    );
  }


  void Zeros(){
    finalScore = 0;
    questionNumber = 0;
  }
  void updateQuestion(){
    mapcolors["a"] = btncolor[0];
    mapcolors["b"] = btncolor[0];
    mapcolors["c"] = btncolor[0];
    mapcolors["d"] = btncolor[0];
    setState(() {
      if(questionNumber == quiz.questions.length - 1){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Summary(score: finalScore,)));

      }else{
        questionNumber++;
      }
    });
  }
}