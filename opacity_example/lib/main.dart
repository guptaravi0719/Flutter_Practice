import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Opacity",
      home: new Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = new GlobalKey<FormState>();
  TextEditingController _emailController;
  TextEditingController _passwordController;
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Example"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 190.0),
            child: new Form(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new TextFormField(
                    onSaved: (value) {
                      _email = value;
                    },
                    decoration: new InputDecoration(
                        hintText: "Email",
                        labelText: "Enter Email",
                        icon: new Icon(Icons.person)),
                    controller: _emailController,
                    autofocus: true,
                    validator: (value) {
                      value.isEmpty ? "Field Cant Be Empty" : null;
                    },
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                  ),
                  new TextFormField(
                    onSaved: (value) {
                      _email = value;
                    },
                    decoration: new InputDecoration(
                        hintText: "password",
                        labelText: "Enter Password",
                        icon: new Icon(Icons.person)),
                    controller: _passwordController,
                    autofocus: true,
                    validator: (value) {
                      value.isEmpty ? "Field Cant Be Empty" : null;
                    },
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                  ),
                  new RaisedButton(
                    onPressed: ValidateAndSave,
                    child: new Text(
                      "Login",
                      style: new TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    color: Colors.redAccent,
                  )
                ],
              ),
              key: formKey,
            ),
          ),
        ),
      ),
    );
  }

  void ValidateAndSave() {
    final form=formKey.currentState;
    if(form.validate()){
      form.save();
      print("Form is Valid email:${_emailController.text.toString()}, ");
      



    }


  }
}
