import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Hello",
      home: new Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  double _height = 50.0;
  double _width = 20.0;
  var _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new AnimatedContainer(
            duration: Duration(seconds: 1),
            color: _color,
            height: _height,
            width: _width,
          )
//              new AnimatedSize(
//
//                curve: Curves.fastOutSlowIn, child: new Container(
//                width: _width,
//                height: _height,
//                color: _color,
//              ), vsync: this, duration: new Duration(seconds: 2),),
              , // new Divider(height: 35.0,),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new IconButton(
                  icon: new Icon(
                    Icons.arrow_upward,
                    color: Colors.green,
                  ),
                  onPressed: () => setState(() {
                        _color = Colors.green;
                        _height = 95.0;
                      })),
              new IconButton(
                  icon: new Icon(
                    Icons.arrow_forward,
                    color: Colors.red,
                  ),
                  onPressed: () => setState(() {
                        _color = Colors.red;
                        _width = 45.0;
                      })),
            ],
          )
        ],
      ),
    ));
  }
}
