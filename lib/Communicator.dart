import 'package:flutter/services.dart';

import 'User.dart';

class Communicator{

  //static const platform = const MethodChannel('demo.bashir.com/info');

  void Print(){
    print("username: " + User.userName +"\npassword: " + User.password);
  }

}
/*

final _auth = FirebaseAuth.instance;
FirebaseUser loggedInUSer;
@override
void initState(){
  super.initState();
  getCurrentUSer();
  print("\nemail: " + loggedInUSer.email );
}
void getCurrentUSer() async{
  try{
    final user = await _auth.currentUser();
    if(user!= null){
      loggedInUSer = user;
    }
  }catch(e){
    print(e);
  }
}
*/
