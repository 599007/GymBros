import 'package:flutter/material.dart';

class Mytextbox extends StatelessWidget{
  final String hintText;

const Mytextbox({
  super.key,
  required this.hintText
  });

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
                    filled: true,
                    hintText: hintText
                    ))))
  ]);
}
}