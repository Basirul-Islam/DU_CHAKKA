import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notification extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('BUS Tracker'),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),

        backgroundColor: Colors.lightGreenAccent[400],
        body: SafeArea(
          child: Container(
            height: 200,
            width: 200,
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(50, 50, 50, 50),
            child: Text("Hello"),
          ),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

