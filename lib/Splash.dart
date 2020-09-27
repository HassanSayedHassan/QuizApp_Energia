
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:materialdesign/main.dart';
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Color appcolor=Color(0xff212d65);


  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MyHomePage(),
      ));
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/ep.jpg"),
        Text(
          "Energia power",
          style: TextStyle(
            fontSize: 40.0,
            color:appcolor,
            fontFamily: "Quando",)
          ),
          ],
        )


    );
  }
}
