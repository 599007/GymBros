import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/pages/loginPage.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:fluttertest/pages/Profile.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}
void signUserOut(){
  FirebaseAuth.instance.signOut();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: Colors.grey[300],
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Text('L O G O', 
              style: TextStyle(fontSize: 35))
             
            )),
            ListTile(
              leading: Icon(Icons.arrow_back, size: 35,
              ),
              title: Text('Go Back',
              style: TextStyle(fontSize: 20)
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => profilePage())
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, size: 35,
              ),
              title: Text('LogOut',
              style: TextStyle(fontSize: 20)
              ),
              onTap: () {
                signUserOut();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyHomePage())
                );
              },
            )
        ],
      )
      ),
    );
   
  }
}
