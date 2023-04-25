import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  void name(params) {
    
  }

  String url = "";

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text('${_auth.currentUser?.email ?? ''}'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                FirebaseFirestore.instance.collection("users").doc(_auth.currentUser?.uid).set({
                  "weight": 100,
                  "email": _auth.currentUser?.email,
                  "height": 188
                });
              },
              child: Text('Espen')
              ),
              TextButton(
              onPressed: () {
                FirebaseFirestore.instance.collection("users").doc(_auth.currentUser!.uid).get().then((value) {
                  setState(() {
                    url = value.data()!["url"];
                  });
                });
              },
              child: Text('get info')
              ),
              Image.network(url)
          ],
        )
        )
    );
  }
}