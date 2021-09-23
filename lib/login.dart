import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginPage extends StatelessWidget {
  //const LoginPage({Key key}) : super(key: key);
  String _email;
  String _password;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

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
                  onSaved: (value) => _email = value,
                  validator: (value) => value.isEmpty ? "Email Field is empty" : null,

                ),
                TextFormField(
                  onSaved: (data) => _password= data,
                  validator: (data) => data.isEmpty ? "Password cant be empty" : null,
                  decoration: InputDecoration(labelText: "password"),
                  obscureText: true,
                ),
                FloatingActionButton(
                    child: Text("Login", style: TextStyle(fontSize: 20.0),)
                    ,
                    onPressed: () => validateAndSubmit()

                )

              ],
            ),
          )
        ));


  }
  bool validateAndSave() {

    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
      //print("Input is vaild, Email: $_email, $_password");
    }
    else{
      return false;
      //print("Input invalid, Email: $_email, $_password");
    }

  }

  validateAndSubmit(){
    if(validateAndSave()){
        FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);


    }
  }

}

