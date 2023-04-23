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

class _MyHomePageState extends State<MyHomePage> {
  Color bgColor = Colors.white10;
  final _formKey = GlobalKey<FormState>();

  String? _email ='';
  String? _password ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
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
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
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
              SizedBox(height: 16.0),
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
              TextButton(
                onPressed: (){
                Navigator.push(context,  MaterialPageRoute(
                  builder: (context) => registerPage()));
              }, child: Text('Register new gymbro'),
              )
          ]
        )))
    );
  }
}
