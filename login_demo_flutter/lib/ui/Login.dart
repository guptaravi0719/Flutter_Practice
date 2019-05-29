import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  void erase() {
    setState(() {
      _userController.clear();
      _passwordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login App"),
        centerTitle: true //centering title
            ,
        backgroundColor: Colors.deepOrange,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.center,
        child: new ListView(

          children: <Widget>[
            new Image.asset(
              'Images/face.png',
              width: 90.0,
              height: 90.0,
              color: Colors.greenAccent,
            ),
            new Container(
              height: 180.0,
              width: screenwidth,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                        hintText: "Username", icon: new Icon(Icons.person)),
                  ),
                  new TextField(
                    controller: _passwordController,
                    decoration: new InputDecoration(
                        hintText: "Password", icon: new Icon(Icons.lock)),


                  ),
                  new Center(
                    //Center
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          margin: const EdgeInsets.only(left: 20.0, top: 20.0),
                          child: new RaisedButton(
                            onPressed: () {
                              debugPrint("Login pressed");
                            },
                            color: Colors.deepOrange,
                            child: new Text(
                              "Login",
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 10.5),
                            ),
                          ),
                        ),
                        new Container(
                          margin: const EdgeInsets.only(left: 150.0, top: 20.0),
                          child: new RaisedButton(
                            onPressed: () {
                              erase();
                            },
                            color: Colors.deepOrange,
                            child: new Text(
                              "Clear",
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 10.5),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Welcome, User",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
