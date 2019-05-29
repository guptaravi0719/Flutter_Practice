import 'package:flutter/material.dart';
import 'cameraScreen.dart';
import 'ChatScreen.dart';
import 'StatusScreen.dart';
import 'CallScreen.dart';
main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(debugShowCheckedModeBanner: false,
      title: "New",
      home: new Home(),
      theme: new ThemeData(
          primaryColor: new Color(0xff075E54),
          accentColor: new Color(0xff25D366)),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(actions: <Widget>[
        new Icon(Icons.search,size: 30.0,),
        new Padding(padding: const EdgeInsets.symmetric(horizontal: 5.0))
       , new Icon(Icons.more_vert,size: 30.0,)
      ],
        title: new Text("WhatsApp"),
        elevation: 0.7,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.camera_alt),
            ),
            new Tab(
              text: "CHATS",
            ),
            new Tab(
              text: "STATUS",
            ),
            new Tab(
              text: "CALLS",
            ),
          ],
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[

          new CameraScreen(),
          new ChatScreen(),
          new StatusScreen(),
          new CallScreen(),

        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
          print("Chat Pressed");
        },
      child:new Icon(Icons.message,color: Colors.white,),
        backgroundColor: Theme.of(context).accentColor,

      ),
    );
  }
}
