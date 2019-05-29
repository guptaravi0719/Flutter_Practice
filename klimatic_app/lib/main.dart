import 'package:flutter/material.dart';
import './ui/home.dart';
import 'package:http/http.dart' as http;
import 'package:klimatic_app/ui/utils/util.dart';
void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Klimatic",
    home:new Home()

  ));


}