import 'package:flutter/material.dart';
import 'package:fluttertest/Profile.dart';
import 'package:fluttertest/register.dart';

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
        primarySwatch: Colors.blueGrey,
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

class _MyHomePageState extends State<MyHomePage> {
  Color bgColor = const Color.fromARGB(255, 27, 27, 27);
  final _formKey = GlobalKey<FormState>();

  String? _email ='';
  String? _password ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
      child: Padding(padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
              color: Color.fromARGB(110, 124, 120, 120),
              borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Email', border: InputBorder.none),
                validator: (value){
                  if(value?.isEmpty ?? true){
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value){
                  _email = value;
                },
                ),
            ),
            SizedBox(height: 5.0),
              Container(
                decoration: BoxDecoration(
                color: Color.fromARGB(110, 124, 120, 120),
                borderRadius: BorderRadius.circular(10.0),
              ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Password', border: InputBorder.none),
                  obscureText: false,
                  validator: (value){
                    if(value?.isEmpty ?? true){
                      return 'Please enter you password';
                    }
                    return null;
                  },
                  onSaved: (value){
                    _password = value;
                  },
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: (){
                  final form = _formKey.currentState;
                  if(form != null && form.validate()){
                  form.save();
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => profilePage()));
                  }
                },
                child: Text('Login'),
              ),
              const SizedBox(height: 50.0),
              Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: (){
                Navigator.push(context,  MaterialPageRoute(
                  builder: (context) => registerPage()));
              }, child: Text('Register new gymbro'),
              )
              )
        ]
              )
      ))
      
        )
        );    
  }
}
