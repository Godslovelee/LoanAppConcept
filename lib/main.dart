import 'package:flutter/material.dart';
import 'package:login_basic/login.dart';
import 'auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      title: "Login Demo",
      home: LoginPage(authFireBase: Auth() ,

      ),
    );
  }
}
