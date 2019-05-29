import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _num1Controller = new TextEditingController();
  TextEditingController _num2Controller = new TextEditingController();
  String _result = "Enter Values ";
  int _FinalResult = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: AssetImage('images/imag.jpg'),
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.darken,
            color: Colors.black87,
          ),
          new Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: new ListView(
              children: <Widget>[
                new Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                          color: Colors.tealAccent, fontSize: 25.0),
                    ),
                  ),
                  child: new Container(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new TextField(
                          decoration: new InputDecoration(labelText: "Enter 1"),
                          style: TextStyle(
                            color: Colors.green,
                          ),
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: _num1Controller,
                        ),
                        new Padding(padding: EdgeInsets.all(10.0)),
                        new TextField(
                          decoration: new InputDecoration(labelText: "Enter 2"),
                          controller: _num2Controller,
                        ),
                        new Text(
                          "Result:  ${_FinalResult} ",
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        new Padding(padding: EdgeInsets.only(top: 20.0)),
                        new Wrap(
                          runSpacing: 10.0,
                          spacing: 100.0,
                          children: <Widget>[
                            new RaisedButton(
                              onPressed: () {
                                setState(() {
                                  _FinalResult = int.parse(
                                          _num1Controller.text.toString()) +
                                      int.parse(
                                          _num2Controller.text.toString());
                                });
                              },
                              color: Colors.blue,
                              child: new Text("+"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                            new RaisedButton(
                              onPressed: () {},
                              color: Colors.blue,
                              child: new Text("-"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                            new RaisedButton(
                              onPressed: () {},
                              color: Colors.blue,
                              child: new Text("*"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                            new RaisedButton(
                              onPressed: () {},
                              color: Colors.blue,
                              child: new Text("/"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
