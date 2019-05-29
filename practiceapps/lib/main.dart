import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "fzv",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _inputTextValid =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(),
      body: new Center(
        child: new TextField(
          decoration: new InputDecoration(
hintText: "Enter An Integer",
       errorText: _inputTextValid?null:"Enter The Number"
          ),
       keyboardType: TextInputType.numberWithOptions(),

   onSubmitted: (String val){
          Fluttertoast.showToast(
            msg: "You Entered : ${int.parse(val)}"
          );


   },
onChanged:(String val){
      setState(() {
        _inputTextValid=false;
      });

},
        ),


      )


    );
  }


}
