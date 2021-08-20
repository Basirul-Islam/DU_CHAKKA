import 'package:DU_CHAKA/screens/HomePageScreen.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'DatabaseService.dart';
import 'package:DU_CHAKA/screens/Schedule.dart';
import 'package:DU_CHAKA/screens/contributor.dart';
import 'ProfileScreen.dart';
import 'AboutScreen.dart';
import '../User.dart';

import 'WelcomeScreen.dart';

class NavDrawer extends StatelessWidget {

  static String ListOfAdminPhoneNo;
  static String ListOfUsersPhoneNO;

  static const platform = const MethodChannel('sendSms');

  Future<Null> sendSms(String body, String PhoneNo) async {
    print("SendSMS");
    try {
      final String result = await platform.invokeMethod(
          'send', <String, dynamic>{
        "phone": PhoneNo,
        "msg": body
      }); //Replace a 'X' with 10 digit phone number
      print(result);
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            decoration: BoxDecoration(
                color: Colors.black38,
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('Images/lalBus.jpeg'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => About()),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {
              DatabseService(uid: User.uid).getUSerData(),
              print("email: " + User.userName + "\npassword: " + User.password),
              if (User.userName != null)
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  ),
                }
            },
          ),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text('Bus Schedule'),
            onTap: () => {
              Navigator.push(
                // ignore: sdk_version_set_literal
                context,
                MaterialPageRoute(builder: (context) => Schedule()),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Bus Location'),
            onTap: () => {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            )

            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Set Notification'),
            onTap: (){
              if(User.userEmail == "duchakka@gmail.com"){
                showDialogBox(context, "notification");
              }
              else{
                Navigator.of(context).pop();
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.face),
            title: Text('Contributor'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Contributor()),
              );
              //Navigator.pushNamed(context, Contributor.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () {
              showDialogBox(context, "Feedback");
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              signOut();
              /* _signOut() async {
                await _firebaseAuth.signOut();
              }*/
              //Navigator.pushNamed(context, WelcomeScreen.id);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WelcomeScreen()),
              );
              /*runApp(MaterialApp(
                //home: WelcomeScreen(),
                initialRoute: WelcomeScreen.id,
                routes:{
                  WelcomeScreen.id: (context) => WelcomeScreen(),
                  HomePage.id: (context) => HomePage(),
                },
                debugShowCheckedModeBanner: false,
              ));*/
            }, /*_signOut,*/
            //onPressed:_signOut;
            //jump to function
          ),
        ],
      ),
    );
  }

  void showDialogBox(BuildContext context, String type) {
    TextEditingController dataController = new TextEditingController();


    showDialog(
      context: context,
      builder: (BuildContext context) {
        int selectedRadio = 0; // Declare your variable outside the builder

        return AlertDialog(
          content: StatefulBuilder(
            // You need this, notice the parameters below:
            builder: (BuildContext context, StateSetter setState) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  // Then, the content of your dialog.
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Write here'),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: dataController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel')),
                        FlatButton(
                            onPressed: () async {
                              if(type == "notification"){
                                Response response;
                                Dio dio = new Dio();

                                response = await dio.get("https://duchakkav2-default-rtdb.firebaseio.com/numbers.json");
                                if(response!=null) {
                                  List<dynamic> data = response.data;
                                  data.forEach((element) {
                                    sendSms(dataController.value.text,element);
                                  });
                                  print(data);
                                }
                              }else{
                                Response response;
                                Dio dio = new Dio();

                                response = await dio.get("https://duchakkav2-default-rtdb.firebaseio.com/numbers.json");
                                if(response!=null) {
                                  List<dynamic> data = response.data;

                                    sendSms(dataController.value.text,data.first);
                                    //sendSms(dataController.value.text,"01676827989");
                                    // can be use a single no also

                                  print(data);
                                }
                              }

                            },
                            child: Text('Send'))
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

void signOut() async {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  await _firebaseAuth.signOut();
  User.userName = null;
  User.userRegNo = null;
  User.userPhoneNo = null;
  User.password = null;
  User.userEmail = null;
}

/* void _signOut() {
    FirebaseAuth.instance.signOut();
    Future<FirebaseUser> Function() user = FirebaseAuth.instance.currentUser;
    //print('$user');
    runApp(
        new MaterialApp(
          home: new WelcomeScreen(),
        )

    );
  }*/
