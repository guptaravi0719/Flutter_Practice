import 'package:flutter/material.dart';
import 'second_screen.dart';
class firstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        actions: <Widget>[
          new IconButton(icon:new Icon( Icons.arrow_back), onPressed: null,padding: new EdgeInsets.all(10.0),)

        ],

        title: new Text("First Screen"),
        centerTitle: true,


      ),
body: new Container(
  child: new RaisedButton(onPressed: (){

    Navigator.push(
     context,
      new MaterialPageRoute(builder: (context) => new secondScreen()),
    );

  }),


),



    );
  }
}
