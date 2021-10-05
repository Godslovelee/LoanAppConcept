

import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

abstract class BaseAuthFireBase{
  Future<String>signInWithEmailAndPassword(email, password);
}

class Auth implements BaseAuthFireBase{
Future<String>signInWithEmailAndPassword(email, password)async{
  FirebaseUser user = (await FirebaseAuth.instance
      .signInWithEmailAndPassword(
      email: email, password: password)) as FirebaseUser;
  return user.uid;

}


}