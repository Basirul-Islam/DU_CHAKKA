//import 'dart:html';
import 'package:flutter/material.dart';

class DTable extends StatelessWidget {
  final String busName;

  const DTable({Key key, this.busName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          centerTitle: true,
            title: Text(
              busName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: 'pacifico'),
            )),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
              ),
              SizedBox(height: 20),
              Text(
                checkSeason(),
                style: TextStyle(
                  fontSize: 26,
                    fontFamily: 'pacifico',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Up Trip',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              DataTable(
                columns: [
                  DataColumn(label: Text('Time')),
                  DataColumn(label: Text('From')),
                  DataColumn(label: Text('Bus No')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('7:20')),
                    DataCell(Text('Kamlapur')),
                    DataCell(Text('4653')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('8:15')),
                    DataCell(Text('Kamlapur')),
                    DataCell(Text('4473')),
                  ]),
                ],
              ),
              Text(
                'Down Trip',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              DataTable(
                columns: [
                  DataColumn(label: Text('Time')),
                  DataColumn(label: Text('From')),
                  DataColumn(label: Text('Bus No')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('7:20')),
                    DataCell(Text('Kamlapur')),
                    DataCell(Text('4653')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('8:15')),
                    DataCell(Text('Kamlapur')),
                    DataCell(Text('4473')),
                  ]),
                ],
              )
            ],
          ),
        ));
  }

  String checkSeason() {
    String season;
    DateTime now = new DateTime.now();
    //DateTime date = new DateTime(now.year, now.month, now.day);
    print(now.year);
    print(now);
    int month = now.month;
    if (month >= 3 && month <= 8) {
      season = "summer schedule";
      return season;
    } else {
      season = "winter schedule";
      return season;
    }
    //print(season);
  }
}
