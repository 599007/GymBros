import 'package:flutter/material.dart';

class registerPage extends StatelessWidget {
  const registerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://i.gyazo.com/2b4200726164fda89e3beb9067be666e.png"),
            fit: BoxFit.cover,
          ),
        ),
       )
    );
  }
}