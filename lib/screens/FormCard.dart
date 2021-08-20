import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../User.dart';
//import 'Communicator.dart';
/*final userName = TextEditingController();
final Password = TextEditingController();*/
class FormCard extends StatelessWidget {
  final String username;
  final String password;

  const FormCard({Key key, this.username,this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(550),
      decoration: BoxDecoration(
          color: Colors.blueGrey[400],
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Login",
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(45),
                    fontFamily: "SourseSansPro",
                    fontWeight: FontWeight.bold,
                    letterSpacing: .6)),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text("User Email",
                style: TextStyle(
                    fontFamily: "SourseSansPro",
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            TextField(
                //controller:userName,
              decoration: InputDecoration(
                  hintText: username,
                  hintStyle: TextStyle(color: Colors.white, fontSize: 15.0)
                  ),
              onChanged: (String str){
                 // print(userName.text);

                User.userEmail = str;
                FormCard(username: User.userEmail,password: '**********',);
              },
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text("Password",
                style: TextStyle(
                    fontFamily: "SourseSansPro",
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: password.replaceAll(password, '........'),
                  hintStyle: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
              onChanged: (String str){
                User.password = str;
                FormCard(username: User.userName,password: User.password,);
              },
            ),



            SizedBox(
              height: ScreenUtil.getInstance().setHeight(35),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Colors.blue[100],
                      fontFamily: "Poppins-Medium",
                      fontSize: ScreenUtil.getInstance().setSp(28)),
                )
              ],
            )
          ],
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