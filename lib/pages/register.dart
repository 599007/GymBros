import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertest/components/my_textbox.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  
  bool? isCheckedMale = false;
  bool? isCheckedFemale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 75),
                Text(
                  'Create Account', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Connect With GymBros From across The World', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 25),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
                 child: Divider(
                    thickness: 1, color: Colors.grey[400]
                 ),
               ),
              const SizedBox(height: 25),
              Mytextbox(),
              const SizedBox(height: 10),
              Mytextbox(),
              const SizedBox(height: 10),
              Mytextbox(),
              const SizedBox(height: 10),
              Mytextbox(),
              Checkbox(value: isCheckedMale,
              activeColor: Colors.green,
              
              onChanged: (newBool){
                setState(){
                  isCheckedMale = newBool;
                }
              })
              ])));
  }
}
