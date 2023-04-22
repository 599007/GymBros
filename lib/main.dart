import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('hei');
  }
}

class _MyHomePageState extends State<MyHomePage> {
  Color bgColor = Colors.white10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("tittel"),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(10),
                color: bgColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                        'https://images.squarespace-cdn.com/content/v1/57d29fb7414fb53b53085151/1496230493344-MFBY8TUF80G2JZUDJSS4/papeg%C3%B8ye-dyrepark',
                        width: 200),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondPage()));
                        },
                        child: Text('Redirect')),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            if (bgColor == Colors.white10) {
                              bgColor = Colors.green;
                            } else {
                              bgColor = Colors.white10;
                            }
                          });
                        },
                        child: Text('Endre farge')),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
