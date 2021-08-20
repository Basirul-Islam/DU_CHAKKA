import 'package:flutter/material.dart';
import '../User.dart';
import 'DatabaseService.dart';
import 'HomePageScreen.dart';

class Profile extends StatelessWidget {
  String email, phoneNo, RegNo;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
            'User Profile',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.teal[400],
      body: new SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 60.0,
            ),
            Container(
              //height: 100.0,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('Images/bashir.jpg'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: IconButton(
                icon: Icon(
                  Icons.camera,
                  size: 30.0,
                ),
                onPressed: () {
                  //getImage();
                  //getImageFromCamera();
                },
              ),
            ),
            Text(
              User.userName,
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 30.0,
                color: Colors.teal.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              color: Colors.white70,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              height: 40.0,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 30.0,
                  ),
                  Icon(
                    Icons.mail,
                    color: Colors.teal,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    User.userEmail,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white70,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              height: 40.0,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 30.0,
                  ),
                  Icon(
                    Icons.verified_user,
                    color: Colors.teal,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    User.userRegNo,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  phoneNo = value;
                  User.userPhoneNo = phoneNo;
                },
                decoration: InputDecoration(
                  prefixIcon: new Icon(Icons.phone),
                  hintText: User.userPhoneNo,
                  filled: true,
                  fillColor: Colors.white70,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  suffixIcon: new Icon(Icons.edit),
                  /*border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                    enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),*/
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              /*Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),*/
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Material(
                  color: Colors.white12,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      //Implement registration functionality.
                      Navigator.push(
                        // ignore: sdk_version_set_literal
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    minWidth: 130.0,
                    height: 35.0,
                    child: Text(
                      'Back',
                      style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Material(
                  color: Colors.white12,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      try {
                        await DatabseService(uid: User.uid).updateUserData(
                            User.userName, User.userRegNo ,User.userPhoneNo);
                      } catch (e) {
                        print(e);
                      }
                    },
                    minWidth: 130.0,
                    height: 35.0,
                    child: Text(
                      'Update Info',
                      style: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }
}
