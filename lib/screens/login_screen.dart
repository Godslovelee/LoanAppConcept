import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../service/auth.dart';
import '../service/root.dart';

enum FormInput { login, register }

class LoginPage extends StatefulWidget {


  LoginPage({this.authFireBase, this.onSignedIn});
  final BaseAuthFireBase authFireBase;
  final VoidCallback onSignedIn;

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String _email;

  String _password;

  FormInput _formInput = FormInput.login;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formInput == FormInput.login) {
          String userID = await widget.authFireBase
              .signInWithEmailAndPassword(_email, _password);

          print("sign-in + $userID");
        } else {
          String userID = await widget.authFireBase
              .createUserWithEmailAndPassword(_email, _password);
          print("create-new-user + $userID");
        }
        widget.onSignedIn();
      } catch (e) {
        print("Error + $e");
      }
    }
  }

  void navigateToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formInput = FormInput.register;
    });
  }

  navigateToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formInput = FormInput.login;
    });
  }

//Widget Tree
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Loan Concept"),
        ),
        body: Container(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(children: buildInputs() + buildSubmitButtons()),
            )));
  }

  //Validative methods

  List<Widget> buildInputs() {
    return [
      TextFormField(
        decoration: InputDecoration(labelText: "email"),
        //saving email and password state
        onSaved: (value) => _email = value,
        validator: (value) => value.isEmpty ? "Email Field is empty" : null,
      ),
      TextFormField(
        onSaved: (data) => _password = data,
        validator: (data) => data.isEmpty ? "Password cant be empty" : null,
        decoration: InputDecoration(labelText: "password"),
        obscureText: true,
      ),
      Padding(
        padding: EdgeInsets.all(15),
      )
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formInput == FormInput.login) {
      return [
        FlatButton(
          color: Colors.blueAccent,
            child: Text(
              "Login",
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () => validateAndSubmit()),
        FlatButton(
          color: Colors.blueAccent,
            child: Text(
              "Create an Account",
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () => navigateToRegister())
      ];
    } else {
      return [
        FlatButton(
          color: Colors.blueAccent,
            child: Text(
              "Create an Account",
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () => validateAndSubmit()),
        FlatButton(
          color: Colors.blueAccent,
            child: Text(
              "Already have an Account? Login",
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () => navigateToLogin())
      ];
    }
  }
}
