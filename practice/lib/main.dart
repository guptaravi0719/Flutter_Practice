import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File _image;
Future getImage() async{
  var image = await ImagePicker.pickImage(source: ImageSource.camera);
setState(() {
  _image=image;
});

}
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "MyApp",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("MyAPp"),
          centerTitle: true,
        ),

body:Center(
//  child: _image==null?new Text("NO Image Selected"):new Image.file(_image),
child :new Image.asset(name)

)

          ,
        floatingActionButton: new FloatingActionButton(onPressed: (){
          getImage();
        }
        ,child: Icon(Icons.camera) 

        ,),
      ),


    );
  }
}
