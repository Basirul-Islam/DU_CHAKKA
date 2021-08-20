

import 'package:cloud_firestore/cloud_firestore.dart';

import '../User.dart';

class DatabseService {

  final String uid;
  DatabseService({this.uid});
  //collection refference
  final CollectionReference userInfoCollection = Firestore.instance.collection('userInfo');

  Future updateUserData(String Name, String RegNo, String phoneNo) async{

    return await userInfoCollection.document(uid).setData({
        'Name' : Name,
        'RegNo' : RegNo,
        'phoneNo' : phoneNo,
    });
  }


    dynamic data;
    final DocumentReference document = Firestore.instance.collection("userInfo")
        .document(User.uid);

    Future getUSerData() async {
      print("i am here & here is the problem to fetch data from database");
      print(uid);
      try{
        await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
          data = snapshot.data;
        });
      }catch(e){
        print(e);
      }
      User.userName =  data['Name'];
      User.userPhoneNo = data['phoneNo'];
      User.userRegNo = data['RegNo'];
      print("name: " + User.userName + "\nemail: " + User.userEmail + "\npassword: " + User.password + "\nphone No: " +
          User.userPhoneNo + "\nRegistration No: " + User.userRegNo);
      //print(data.toString());
    }
}