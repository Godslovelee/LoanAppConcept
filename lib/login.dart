import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  //const LoginPage({Key key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String _email;
    String password;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Basic"),
      ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(

            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "email"),
                  //saving email and password state
                  onSaved: (data) => _email = data,
                  validator: (value) => value.isEmpty ? "Email Field is empty" : null,

                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "password"),
                  obscureText: true,
                ),
                FloatingActionButton(
                    child: Text("Login", style: TextStyle(fontSize: 20.0),)
                    ,
                    onPressed: validate()

                )

              ],
            ),
          )
        ));
  }

  validate() {
    final form = formKey.currentState;
    if(form.validate()){
      print("Input is vaild");
    }
    else{
      print("Input invalid");
    }

  }
}
