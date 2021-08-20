import 'package:flutter/material.dart';
import '../User.dart';
import 'DatabaseService.dart';
import 'HomePageScreen.dart';

class About extends StatelessWidget {
  String email, phoneNo, RegNo;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.teal[400],
      body: new SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 60.0,
            ),
            /*Container(
              color: Colors.white70,
              margin: EdgeInsets.symmetric(vertical: 100.0, horizontal: 25.0),
              height: 500.0,
              width: 300,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                    width: 100,
                  ),
                  Text(
                    'ABOUT US',
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 10.0,
                      color: Colors.teal.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),*/
            Container(
              color: Colors.white70,
              margin: EdgeInsets.symmetric(vertical: 100.0, horizontal: 25.0),
              height: 500.0,
              width: 300,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                  ),
                  Text(
                    'ABOUT US',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 25.0,
                      color: Colors.teal.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    'This is a regularly needed android'
                        '\napp. This bus route app '
                        '\ncontains all the names and routes'
                        '\nof bus servises of Dkaka University.'
                        '\nYou can find names of any bus '
                        '\nof Dhaka University'
                        '\nusing this bus service app.This'
                        '\n android app can help you'
                        '\nproviding list of bus routes.'
                        '\nYou can search for a particular '
                        '\nbus location in map.This app'
                        '\nwill also send notification of the bus'
                        '\nto its users. In the near '
                        '\nfuture we will add all bangladesh '
                        '\nbus and intercity bus fare list.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 15.0,
                      color: Colors.teal.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
