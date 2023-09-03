import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertest/components/my_textbox.dart';
import 'package:fluttertest/components/my_checkbox.dart';
import 'package:fluttertest/pages/loginPage.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isCheckedMale = false;
  bool isCheckedFemale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(height: 75),
          Text(
            'Create Account',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Text(
            'Connect With GymBros From Across The World',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(thickness: 1, color: Colors.grey[400]),
          ),
          const SizedBox(height: 25),
          Mytextbox(
           hintText: 'Username'
          ),
          const SizedBox(height: 10),
          Mytextbox(
            hintText: 'Email'
          ),
          const SizedBox(height: 10),
          Mytextbox(
             hintText: 'Password'
          ),
          const SizedBox(height: 10),
          Mytextbox(
             hintText: 'Repeat Password'
          ),
          const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  MyCheckBox(
                    text: 'Male',
                  ),
                  MyCheckBox(
                    text: 'Female'
                  )
              ],
            ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(thickness: 1, color: Colors.grey[400]),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ElevatedButton(
              onPressed: () {
          
              },
               child: Text ('Submit'),
               style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                minimumSize: MaterialStateProperty.all(Size(400, 60))
               ),
              ),
          ),
          const SizedBox(height: 100),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
            },
            child: Text('Already have an account?')
            )
        ])));
  }
}
