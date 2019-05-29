import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeState();
}

class HomeState extends State<Home> {
  double _finalresult = 0.0;
  String _formattedResult="";
  int radioValue = 0;
  final TextEditingController _weightController = new TextEditingController();

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          _finalresult = calculateWeight(_weightController.text, 0.06);

_formattedResult="Your Weight on pluto is $_finalresult";
          break; //calculate pluto side wieight
        case 1:
          _finalresult = calculateWeight(_weightController.text, 0.38);
          _formattedResult="Your Weight on pluto is $_finalresult";
          break;
        case 2:
          _finalresult = calculateWeight(_weightController.text, .28);
          _formattedResult="Your Weight on pluto is $_finalresult";
          break;
        default:
          print("nothing Selected");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight on Planet X"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: new Container(
        color: Colors.greenAccent,
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            new Image.asset(
              'images/planet.png',
              height: 150.0,
              width: 130.0,
            ),
            new Container(
              margin: const EdgeInsets.all(3.8),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      hintText: "In pounds",
                      labelText: "your Weight on Earth",
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),
                  new Padding(padding: EdgeInsets.all(5.5)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                        activeColor: Colors.orange,
                        value: 0,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                      ),
                      new Text(
                        "Pluto",
                        style: new TextStyle(color: Colors.blue),
                      ),
                      new Radio<int>(
                        activeColor: Colors.red,
                        value: 1,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                      ),
                      new Text(
                        "Mars",
                        style: new TextStyle(color: Colors.blue),
                      ),
                      new Radio<int>(
                        value: 2,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                      ),
                      new Text(
                        "Venus",
                        style: new TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  new Padding(padding: new EdgeInsets.all(15.0)),
                  new Text(

                  _weightController.text.isEmpty?"please Enter Weight": _formattedResult,
                    style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    } else {

      print("Wrong");
      return int.parse("80.02") * .30;
    }
  }
}
