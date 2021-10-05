import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';
enum FormInput { login, register }

class LoginPage extends StatefulWidget {
  //const LoginPage({Key key}) : super(key: key);

  LoginPage({this.authFireBase});
  final BaseAuthFireBase authFireBase;

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
      //print("Input is vaild, Email: $_email, $_password");
    }
    return false;
    //print("Input invalid, Email: $_email, $_password");
  }

  validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formInput == FormInput.login) {
          FirebaseUser user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(
              email: _email, password: _password)) as FirebaseUser;
          print("Login with password with  + ${user.uid}");
        }



      else {
        FirebaseUser user = (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _email, password: _password)) as FirebaseUser;
        print("object + ${user.uid}");
      }


    }
    catch(e){
        print("Error + $e");
    }
      }
    }


  void NavigateToRegister() {
    formKey.currentState.reset();
    setState(() {

      _formInput = FormInput.register;
    });
  }

  NavigateToLogin() {
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
          title: Text("Login Basic"),
        ),
        body: Container(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(children: buildInputs()  + buildSubmitButtons()),
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
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formInput == FormInput.login) {
      return [
        FloatingActionButton(
            child: Text(
              "Login",
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () => validateAndSubmit()),
        FloatingActionButton(
            child: Text(
              "Create an Account",
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () => NavigateToRegister())
      ];
    } else {
      return [
        FloatingActionButton(
            child: Text(
              "Create an Account",
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () => validateAndSubmit()),
        FloatingActionButton(
            child: Text(
              "Already have an Account? Login",
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () => NavigateToLogin())
      ];
    }
  }
}
