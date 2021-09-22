import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Basic"),
      ),
        body: Container(
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "email"),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "email"),
                ),

              ],
            ),
          )
        ));
  }
}
