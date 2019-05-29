import 'package:flutter/material.dart';

class MakeItRain extends StatefulWidget {
  State<StatefulWidget> createState() {
    return new MakeItRainState();
  }
}

class MakeItRainState extends State<MakeItRain> {
  int _moneyCounter = 1000;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Make It Rain"),
        backgroundColor: Colors.lightGreen,
      ),
      body: new Container(
        child: Column(
          children: <Widget>[
            new Center(
              child: new Text(
                "Get String",
                style: new TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w900,
                    fontSize: 29.9),
              ),
            ),
            new Expanded(
                child: new Center(
              child: new Text(
                "$_moneyCounter",
                style: new TextStyle(
                    color: _moneyCounter>1500?Colors.red:Colors.lightGreen, fontWeight: FontWeight.w900),
              ),
            )),
            new Expanded(
                child: new Center(
              child: new FlatButton(color: Colors.lightGreen,
                  onPressed: () {
                    setState(() {
                      _moneyCounter=_moneyCounter+200;
                    });

                  },
                  child: new Text(
                    "Let it Rain",
                    style: new TextStyle(fontSize: 19.9),
                  ),
              ),
            )),




          ],
        ),
      ),

    bottomNavigationBar: BottomNavigationBar(items:[
      BottomNavigationBarItem(icon:new Icon(Icons.ac_unit),title: new Text("AC unit")),
      BottomNavigationBarItem(icon:new Icon(Icons.call_missed ),title: new Text("Missed Calls"))
      
    ]),
    );
  }
}
