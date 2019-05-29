import 'dart:convert';

import 'package:flutter/material.dart';
import './utils/util.dart' as util;
import 'package:http/http.dart' as http;
import 'dart:async';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
void showstuff() async{
  Map data=await getWheather(util.appId, util.defaultCity);
  print(data['weather'][0]['id']);

}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("KLIMATIC"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu),
          onPressed: showstuff,

          )
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
              child: new Image.asset(
            "images/umbrella.png",
            width: 490.0,
            height: 1200,
            fit: BoxFit.fill,
          )),
          new Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 0.0),
            child: new Text(
              "Spoken",
              style: cityStyle(),
            ),
          ),
          new Container(
            alignment: Alignment.center,
            child: new Image.asset("images/light_rain.png"),
          ),
          new Container(
            margin: const EdgeInsets.fromLTRB(30.0, 300.0, 0.0, 0.0),
            child: new Text(
              "68.02F",
              style: tempStyle(),
            ),
          )
        ],
      ),
    );
  }
}

Future<Map> getWheather(String appId, String city) async {
  String apiUrl =
      "https://samples.openweathermap.org/data/2.5/weather?q=$city&appid=${util.appId}";
  http.Response response = await http.get(apiUrl);

  return json.decode(response.body);
}

TextStyle cityStyle() {
  return new TextStyle(
      color: Colors.white, fontStyle: FontStyle.italic, fontSize: 23.0);
}

TextStyle tempStyle() {
  return new TextStyle(
      color: Colors.white, fontSize: 49.9, fontWeight: FontWeight.w500);
}
