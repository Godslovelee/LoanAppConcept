import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email;
    String password;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Basic"),
      ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "email"),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "password"),
                  obscureText: true,
                ),
                FloatingActionButton(
                    child: Text("Login", style: TextStyle(fontSize: 20.0),)
                    ,
                    onPressed: )

              ],
            ),
          )
        ));
  }
}
