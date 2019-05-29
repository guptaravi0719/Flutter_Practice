import 'package:flutter/material.dart';
import './Splash/splash.dart';
main() {
  runApp(Splash());
}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      debugShowCheckedModeBanner: true,
//      title: "Login",
//      home: LoginApp(),
//      theme: new ThemeData(primarySwatch: Colors.blue),
//    );
//  }
//}

class LoginApp extends StatefulWidget {
  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.greenAccent,
        body:

          new Stack(
            fit: StackFit.expand,
            children: <Widget>[
              new Image(
                image: AssetImage('images/image1.jpg'),
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.darken,
                color: Colors.black87,

              ),


             Padding(
               padding: const EdgeInsets.only(top: 100.0),
               child: new ListView(
                  children: <Widget>[
                    Center(
                      child: new Theme(data: new ThemeData(
                        brightness: Brightness.dark,inputDecorationTheme: new InputDecorationTheme(
                        labelStyle: new TextStyle(color: Colors.tealAccent,fontSize: 25.0),


                      ),


                      ), child:
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new FlutterLogo(size: _iconAnimation.value * 140.0),
                          new Container(
                            padding: const EdgeInsets.all(40.0),
                            child: new Form(
                                child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new TextFormField(
                                  decoration: new InputDecoration(
                                      labelText: "Enter Email", fillColor: Colors.white),
                                keyboardType: TextInputType.emailAddress,
                                ),
                                new TextFormField(

                                  decoration: new InputDecoration(
                                    labelText: "Enter Password",
                                    fillColor: Colors.white,


                                  ),
                                  obscureText: true,

                                )
                                ,new Padding(padding: const EdgeInsets.all(30.0),


                                ),
                                new MaterialButton(onPressed: (){},color: Colors.deepOrange,textColor: Colors.white,child: new Text("Login"),)

                              ],
                            )),
                          )
                        ],
                      )
                      ),
                    ),
                  ],
                ),
             )],
          ),
        );
  }
}
