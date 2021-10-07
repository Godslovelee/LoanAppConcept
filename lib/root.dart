
import 'package:flutter/material.dart';
import 'auth.dart';
import 'login.dart';

class RootPage extends StatefulWidget{

  RootPage({this.authFireBase});
  final BaseAuthFireBase authFireBase;



  @override
_RootPageState createState() => new _RootPageState();

}
enum Auth_Status{
  notSignIn,
  SignedIn,
}

class _RootPageState  extends State<RootPage> {

  Auth_Status _auth_status = Auth_Status.notSignIn;

  @override
  Widget build(BuildContext context) {
    switch (_auth_status) {
      case Auth_Status.notSignIn:
        return LoginPage(authFireBase: widget.authFireBase,);
      case Auth_Status.SignedIn:
        return new Container(
          child: Text("Welcome"),
        );
    }
  }
}
