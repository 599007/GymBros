import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/pages/Profile.dart';
import 'package:fluttertest/pages/register.dart';
import 'package:fluttertest/main.dart';

void signIn(BuildContext context, _email, _password) async {
  showDialog(
    context: context, builder: (context){
      return Center(
        child: CircularProgressIndicator()
        );
      }
    );
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
      if (credential.user != null) {
        Navigator.pop(context);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => profilePage()));
      } else{
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmailMessage(context);
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage(context);
      }
    }
  }

  void wrongEmailMessage(context) {
    showDialog(
     context: context,
     builder: (context){
      return AlertDialog(
        title: Text('Incorrect Email'),
      );
     }
     );
  }

  void wrongPasswordMessage(context) {
    showDialog(
     context: context,
     builder: (context){
      return AlertDialog(
        title: Text('Incorrect Password'),
      );
     }
     );
  }