import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeState();
}

class HomeState extends State<Home> {
  String _Result = "";
  int _finalResult = 0;
  String _over = "";
  String Weight = null;

  TextEditingController _ageController = new TextEditingController();
  TextEditingController _weightController = new TextEditingController();
  TextEditingController _heightController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    double screenWidth = MediaQuery.of(context).size.width;

    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.pinkAccent,
          title: new Text(
            "BMI APP",
          ),
          centerTitle: true,
        ),
        body: new Container(
          color: Colors.lightBlue[50],
          child: ListView(
            children: <Widget>[
              new Container(
                  margin: EdgeInsets.only(top: 50.0),
                  child: new Image.asset(
                    "images/bmilogo.png",
                    height: 120.0,
                    width: 120.0,
                  )),
              new Container(
                margin: EdgeInsets.all(5.0),
                color: Colors.grey,
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      scrollPadding: new EdgeInsets.all(10.0),
                      controller: _ageController,
                      decoration: new InputDecoration(
                          hintText: "Age", icon: new Icon(Icons.person),labelText: "Enter Age"),
                    ),
                    new TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      scrollPadding: new EdgeInsets.all(10.0),
                      controller: _heightController,
                      decoration: new InputDecoration(
                          hintText: "Height",
                          icon: new Icon(Icons.equalizer),
                          labelText: "Enter Height"),
                    ),
                    new TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      //  scrollPadding: new EdgeInsets.all(10.0),
                      controller: _weightController,
                      decoration: new InputDecoration(
                          hintText: "Weight",
                          icon: new Icon(Icons.insert_comment),labelText: "Enter Weight"),
                    ),
                    new Container(
                      margin: EdgeInsets.all(20.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            child: new RaisedButton(
                              onPressed: () {
                                setState(() {
                                  _finalResult = int.parse(
                                          _weightController.text.toString()) +
                                      int.parse(
                                              _ageController.text.toString()) *
                                          2 +
                                      int.parse(
                                          _heightController.text.toString());

                                  _Result =
                                      ""; //weightController.text.toString();
                                  if (_finalResult > 100) {
                                    _over = "OVERWEIGHT";
                                  }
                                });
                              },
                              child: new Text("Calculate"),
                              color: Colors.deepOrange,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              new Container(
                child: new Center(
                  child: new Text(
                    "Your BMI $_finalResult",
                    style: new TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              new Container(
                child: new Center(
                  child: new Text(
                    "" + _over,
                    style: new TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
