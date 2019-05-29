import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';


Map _data;
List _features;

void main() async {
  _data = await getQuakes();
  _features = _data['features'];

  runApp(new MaterialApp(
    title: "Quakes",
    home: new Quakes(),
  ));
}

class Quakes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.deepOrange,
          title: new Text("Quakes"),
          centerTitle: true,
        ),
        body: new ListView.builder(
          itemCount: _features.length,
          padding: EdgeInsets.all(15.0),
          itemBuilder: (BuildContext context, int position) {
            print(_features[position]['properties']['place']);
            if (position.isOdd) return new Divider();
            final index = position ~/ 2;
            //       var format = new DateFormat.yMMMMd("enUS").add_jm();
            var date = new DateTime.fromMicrosecondsSinceEpoch(
                _features[index]['properties']['time'] * 1000,
                isUtc: true);

            return new ListTile(
              leading: new CircleAvatar(
                backgroundColor: Colors.lightGreenAccent,
                child: new Text(
                  "${_features[index]['properties']['mag']}",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Colors.black),
                ),
              ),
              title: new Text(
                "At: $date",
                style: new TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              subtitle: new Text(
                "${_features[index]['properties']['place']}",
                style: new TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 14.0),
              ),
              onTap: () {
                _showAlertMessage(context, "${_features[index]['properties']['type']}");
              },
            );
          },
        ));
  }
}

void _showAlertMessage(BuildContext context,String message) {
  var alert = new AlertDialog(
    title: new Text("Type"),
    content: new Text(message),
    actions: <Widget>[
      new RaisedButton(onPressed: () {
       Navigator.pop(context);
      },child: new Text("OK"),textColor: Colors.white,),

    ],

  ) ;
 showDialog(context: context,child:alert  )
  ;


}



Future<Map> getQuakes() async {
  String apiUrl =
      "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson";

  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}
