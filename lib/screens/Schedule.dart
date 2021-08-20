import 'package:flutter/material.dart';
import 'BusSearch.dart';
import 'DTable.dart';

class Schedule extends StatelessWidget {
  final buses = [
    "srabon",
    "Khonika",
    "Boishakhi",
    "Choitali",
    "Falguni",
    "Hemonto",
    "IshaKha",
    "Kinchit",
    "Bosonto",
    "Moitree",
    "Torongo",
    "Ullash"
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Search Bus Schedule'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: BusSearch());
            },
          )
        ],
        /*Text('BUS Tracker'),*/
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
      ),
      body: new Container(
        child: new ListView.builder(
          reverse: false,
          itemBuilder: (_, int index) => EachList(this.buses[index]),
          itemCount: this.buses.length,
        ),
      ),
    );
  }
}

class EachList extends StatelessWidget {
  final String name;
  EachList(this.name);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // put some code here.
        //debugPrint("u have tapped me");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DTable(busName: name,)),
        );
      },
      child: new Card(
        child: new Container(
          padding: EdgeInsets.all(8.0),
          child: new Row(
            children: <Widget>[
              new CircleAvatar(
                child: new Text(name[0]),
              ),
              new Padding(padding: EdgeInsets.only(right: 10.0)),
              new Text(
                name,
                style: TextStyle(fontSize: 20.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}