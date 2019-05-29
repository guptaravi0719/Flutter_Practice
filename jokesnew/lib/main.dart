import 'package:flutter/material.dart';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:intl/intl.dart';


Map _data;
List _features;

void main() async {
  _data = await getQuakes();
 // _features = _data['features'];

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
          itemCount: _data.length,
          padding: EdgeInsets.all(15.0),
          itemBuilder: (BuildContext context, int position) {
         //   print(_features[position]['properties']['place']);
            if (position.isOdd) return new Divider();
            final index = position ~/ 2;
            //       var format = new DateFormat.yMMMMd("enUS").add_jm();
//            var date = new DateTime.fromMicrosecondsSinceEpoch(
//                _features[index]['properties']['time'] * 1000,
//                isUtc: true);

            return new ListTile(
              leading: new CircleAvatar(
                backgroundColor: Colors.lightGreenAccent,
              child: new Image.network(_data['icon_url']),
              ),
              title: new Text(
               _data['value']
              ),
            onTap: (){
                _showAlertMessage(context, _data['value']);

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
"https://jokes-3f818.firebaseio.com/";
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}
