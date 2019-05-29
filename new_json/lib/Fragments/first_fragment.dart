import 'package:flutter/material.dart';
class Home extends StatelessWidget {
 String title1;
  Home(this.title1);


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(

        title: new Text(title1),
        centerTitle: true,
      ),
    body: new ListView(
      children: <Widget>[
        new Text("Ravi")

      ],

    ),

    );
  }
}

