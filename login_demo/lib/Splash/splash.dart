import 'dart:async';
import 'package:login_demo/main.dart';

import 'package:flutter/material.dart';
class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new  MaterialApp(

      title: "Login",
  home:SplashScreen()

    );
  }
}




class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.push(context ,new MaterialPageRoute(builder: (context)=>new LoginApp()));

    });
  }


  @override

  Widget build(BuildContext context) {
    return new Scaffold(

      backgroundColor: Colors.redAccent,
body: new Container(
  decoration: new BoxDecoration(color: Colors.greenAccent),
  child: new Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
new Text("Hello"),
      //new CircularProgressIndicator(backgroundColor: Colors.black,)

    ],

  ),

),

    );

  }
}
