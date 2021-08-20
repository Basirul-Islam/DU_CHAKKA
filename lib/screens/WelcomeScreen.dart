import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:DU_CHAKA/screens/FormCard.dart';
import '../Communicator.dart';
import 'HomePageScreen.dart';
import 'Imagepicker.dart';
import 'RegistrationScreen.dart';
import '../User.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<WelcomeScreen> {
  FormCard formCard = null;
  bool _isSelected = false;

  final _auth = FirebaseAuth.instance;
  bool cUSer = false;
  void getCurrentUSer() async{
    try{
      final user = await _auth.currentUser();
      if(user!= null){
        cUSer = true;
       /* loggedInUSer = user;*/
        //print("\nemail: " + user.email );
        //signOut();
      }
      //getCurrentUSer();
    }catch(e){
      print(e);
    }
  }
  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected) => Container(
    width: 16.0,
    height: 16.0,
    padding: EdgeInsets.all(2.0),
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2.0, color: Colors.black)),
    child: isSelected
        ? Container(
      width: double.infinity,
      height: double.infinity,
      decoration:
      BoxDecoration(shape: BoxShape.circle, color: Colors.black),
    )
        : Container(),
  );

  Widget horizontalLine() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      width: ScreenUtil.getInstance().setWidth(120),
      height: 1.0,
      color: Colors.black26.withOpacity(.2),
    ),
  );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white70,
      resizeToAvoidBottomInset: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          /* Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                //padding: EdgeInsets.only(top: 20.0, right: 30.0),
                child: Image.asset("assets/lalBus.jpeg"),
              ),
              Expanded(
                child: Container(),
              ),
              Image.asset('Images/lalBus.jpeg')
            ],
          ),*/
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      /* Image.asset(
                        "assets/lalBus.jpeg",
                        width: ScreenUtil.getInstance().setWidth(110),
                        height: ScreenUtil.getInstance().setHeight(110),
                      ),*/
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('Images/lalBus.jpeg'),
                      ),
                      SizedBox(
                        width: ScreenUtil.getInstance().setHeight(60),
                      ),
                      Text("DU CHAKA",
                          style: TextStyle(
                              color: Colors.teal,
                              fontFamily: "pacifico",
                              fontSize: ScreenUtil.getInstance().setSp(46),
                              letterSpacing: .6,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(90),
                  ),
                  FormCard(username: '       @gmail.com', password: 'hello',),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 12.0,
                          ),
                          GestureDetector(
                            onTap: _radio,
                            child: radioButton(_isSelected),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text("Remember me",
                              style: TextStyle(
                                  fontSize: 12, fontFamily: "Poppins-Medium"))
                        ],
                      ),
                      InkWell(
                        child: Container(
                          width: ScreenUtil.getInstance().setWidth(330),
                          height: ScreenUtil.getInstance().setHeight(100),
                          //padding: EdgeInsets.only(bottom: 200.0),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xFF17ead9),
                                Color(0xFF6078ea)
                              ]),
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF6078ea).withOpacity(.03),
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 8.0)
                              ]),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () async{
                                try{
                                  //print("email: " + User.userName + "\npassword: " + User.password);
                                  final user = await _auth.signInWithEmailAndPassword(email: User.userEmail, password: User.password);
                                  if(user!=null){
                                    print("signed in");
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => HomePage()),
                                    );
                                  }
                                }catch(e){
                                  print(e);
                                }
                                // print("username: " + User.userName);
                                //Communicator(username: User.userName,).Print();
                                /*Communicator().Print();*/
                                //getCurrentUSer();
                               /* if(cUSer!= false){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomePage()),
                                  );
                                }
                                else {
                                  print("please sign in first");
                                  final user = _auth.signInWithEmailAndPassword(email: User.userName, password: User.password);
                                }*/
                                //Navigator.pushNamed(context, HomePage.id);
                              },
                              child: Center(
                                child: Text("SIGN IN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins-Bold",
                                        fontSize: 18,
                                        letterSpacing: 1.0)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "New User? ",
                        style: TextStyle(fontFamily: "Poppins-Medium"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegistrationScreen()),
                          );
                        },
                        child: Text("SignUp",
                            style: TextStyle(
                                color: Color(0xFF5d74e3),
                                fontFamily: "Poppins-Bold")),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
