import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import 'DatabaseService.dart';
import 'WelcomeScreen.dart';
import 'HomePageScreen.dart';
import '../User.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  File _image;
  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      //propic = image;
    });
  }
  Future uploadPic() async{
    String fileName = basename(_image.path);
    final StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
    final StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
    /*setState(() {
      print("Profile Picture uploaded");
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
    });*/
  }



  String name,email,password,phoneNo,RegNo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('Create Profile'),
      ),
      body: /*Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),*/
    //new Container(
    new SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Container(
              //height: 100.0,
              child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white70,
                  child: ClipOval(
                    child: new SizedBox(
                      width: 180.0,
                      height: 180.0,
                      child: (_image!=null)?Image.file(
                        _image,
                        fit: BoxFit.fill,
                      ): Image.asset("Images/defaultPropic.jpg"),
                    ),
                  ),
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
                  getImageFromCamera();
                },
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
                  name = value;
                  User.userName = name;
                },
                decoration: InputDecoration(
                  prefixIcon: new Icon(Icons.person),
                  hintText: 'Enter your Name',
                  filled: true,
                  fillColor: Colors.white70,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  suffixIcon: new Icon(Icons.edit),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                  User.userEmail = email;
                },
                decoration: InputDecoration(
                  prefixIcon: new Icon(Icons.email),
                  hintText: 'Enter your Email',
                  filled: true,
                  fillColor: Colors.white70,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  suffixIcon: new Icon(Icons.edit),
                ),
              ),
            ),

            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  //Do something with the user input.
                 password = value;
                  User.password = password;
                },
                decoration: InputDecoration(
                  prefixIcon: new Icon(Icons.lock),
                  hintText: 'Enter your password',
                  filled: true,
                  fillColor: Colors.white70,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  suffixIcon: new Icon(Icons.edit),
                ),
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
                  hintText: "Enter your Phone NO",
                  filled: true,
                  fillColor: Colors.white70,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  suffixIcon: new Icon(Icons.edit),
                ),
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
                  RegNo = value;
                  User.userRegNo = RegNo;
                },
                decoration: InputDecoration(
                  prefixIcon: new Icon(Icons.verified_user),
                  hintText: 'Enter your Registration No',
                  filled: true,
                  fillColor: Colors.white70,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  suffixIcon: new Icon(Icons.edit),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              /*Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),*/
                children: <Widget>[
                  SizedBox(
                    width: 50.0,
                  ),
                  Material(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () {
                        //Implement registration functionality.
                        Navigator.pushNamed(context, WelcomeScreen.id);
                      },
                      minWidth: 130.0,
                      height: 42.0,
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Material(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async{
                        //Implement registration functionality.
                       print("name: " + User.userName + "\nemail: " + User.userEmail + "\npassword: " + User.password + "\nphone No: " +
                           User.userPhoneNo + "\nRegistration No: " + User.userRegNo);
                       try{
                        AuthResult newUSer = await _auth.createUserWithEmailAndPassword(email: User.userEmail, password: User.password);
                        //uploadPic();
                        FirebaseUser user = newUSer.user;
                        User.uid = user.uid;
                        await DatabseService(uid: user.uid).updateUserData(User.userName, User.userRegNo ,User.userPhoneNo);
                        print("userdT updated");
                         if(newUSer!= null){

                           Response response;
                           Dio dio = new Dio();

                           response = await dio.get("https://duchakkav2-default-rtdb.firebaseio.com/numbers.json");
                           if(response!=null) {
                             List<dynamic> data = response.data;

                             print(data);

                             data.add(User.userPhoneNo);

                             response = await dio.put("https://duchakkav2-default-rtdb.firebaseio.com/numbers.json", data: data);
                             print(response.data.toString());
                           }
                           //Navigator.pushNamed(context, HomePage.id);
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => HomePage()),
                           );
                         }
                       }catch(e){
                         print(e);
                       }
                      },
                      minWidth: 130.0,
                      height: 42.0,
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ], /**/
              //),
            ),
            SizedBox (
              height: 10.0,
            )
          ],
        ),
      //),
    //),
    ),
   );
  }
}
