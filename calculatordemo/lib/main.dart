import 'package:flutter/material.dart';
import 'home.dart';
main(){
  runApp(MyApp());


}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Calculator",
      home: new Home(),
    );
  }
}
