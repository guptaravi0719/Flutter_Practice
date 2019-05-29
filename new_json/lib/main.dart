import 'package:flutter/material.dart';
import './Fragments/first_fragment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dart:async';

List _data;

void main() async {
  _data = await getson();

  runApp(new MaterialApp(
    title: "new JSON",
    home: new App(),
  ));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("My New Json"),
        centerTitle: true,
      ),
      body: new ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int position) {
            return new ListTile(
              title: new Text("${_data[position]['title']}"),
              leading: new CircleAvatar(
                child: new Text(
                  "${_data[position]['id']}",
                  style: new TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.white),
                ),
                backgroundColor: Colors.pink,
              ),
           onTap: (){
              _showDialogue(context,"${_data[position]['title']}");}
            );
          }),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Ravi Gupta"),
              accountEmail: new Text(
                "guptaravi00719@gmail.com",
              ),
              currentAccountPicture: Image.asset("images/Ravi.jpg"),
            ),
            new ListTile(
              title: new Text("Fragment 1"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Home("Firstone")));
              },
              leading: Icon(Icons.person),
            ),
            new ListTile(
              title: new Text("Close"),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void _showDialogue(BuildContext context, String s) {

    var alert= AlertDialog
      titleTextStyle: new TextStyle(fontWeight: FontWeight.w900,color: Colors.white,fontStyle: FontStyle.italic),


      backgroundColor: Colors.blue,
      title: new Text("this is ${_data[1]['id']}"),
      content: new Text(s),
      actions: <Widget>[
        new FlatButton(onPressed: (){

Navigator.pop(context);

        }, child: new Text("OK",style: new TextStyle(fontStyle: FontStyle.italic,color: Colors.white),))

      ],




    );

showDialog(context: context,child: alert);
  }
}

Future<List> getson() async {
  //getting data from http in json
  String appUrl = "https://jsonplaceholder.typicode.com/posts";
  http.Response response = await http.get(appUrl);
  return json.decode(response.body);
}
