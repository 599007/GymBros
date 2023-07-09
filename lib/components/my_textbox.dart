import 'package:flutter/material.dart';

class Mytextbox extends StatelessWidget{
const Mytextbox({super.key});

@override
Widget build(BuildContext context){
  return Column(children: [
    Container(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true))))
  ]);
}
}