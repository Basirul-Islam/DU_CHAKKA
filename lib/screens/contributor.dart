import 'package:flutter/material.dart';
class Contributor extends StatelessWidget {
  static const String id = 'contributor_screen';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Contributor'),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.teal[300],
      body: SafeArea(
        child: Column(

          //mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            SizedBox(
              height: 100.0,
            ),

            Align(
              alignment: Alignment.centerRight,
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('Images/bashir.jpg'),
            ),
            Text('Bashirul Islam',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            Text(
              'Institute of Information Technology\n'
                  'University of Dhaka\n'
                  'Email: bsse1022@iit.du.ac.bd',
              //TextAlign.center,
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                fontSize: 20.0,
                color: Colors.white,
                //fontWeight: FontWeight.bold,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
            ),
            SizedBox(
              height: 10.0,
            ),
           /* CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('Images/bashir.jpg'),
            ),
            Text('Sadman Sakib',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),*/
            /*Text(
              'Institute of Information Technology\n'
                  'University of Dhaka\n'
                  'Email: bsse1005@iit.du.ac.bd',
              //TextAlign.center,
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
