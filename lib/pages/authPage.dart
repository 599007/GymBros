import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertest/Pages/Profile.dart';
import 'package:fluttertest/main.dart';
import 'package:fluttertest/pages/loginPage.dart';

import '../components/Wrapper.dart';

class authPage extends StatelessWidget {
  const authPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return const Wrapper();
          }
          else {
            return const MyHomePage();
          }
        },
      ),
    );
  }
}