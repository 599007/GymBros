import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/Profile.dart';
import 'package:fluttertest/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  Color bgColor = Color.fromARGB(255, 255, 255, 255);
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  signIn() async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);

      if (credential.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => profilePage()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bgColor,
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  const SizedBox(height: 80),
                  ClipRRect(
                      child: Image.asset("assets/logo.png",
                          height: 180, width: 180),
                      borderRadius: BorderRadius.circular(50)),
                  const SizedBox(height: 70),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: Color.fromARGB(192, 222, 222, 222),
                          borderRadius: BorderRadius.circular(0.0),
                          
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Email',
                              border: InputBorder.none),
                          validator: (value) {
                            return value?.isEmpty ?? true
                                ? 'Please enter your email'
                                : null;
                          },
                          onSaved: (value) {
                            _email = value ?? "";
                          },
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: Color.fromARGB(192, 222, 222, 222),
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Password', border: InputBorder.none),
                          obscureText: false,
                          validator: (value) {
                            return value?.isEmpty ?? true
                                ? 'Please enter you password'
                                : null;
                          },
                          onSaved: (value) {
                            _password = value ?? "";
                          },
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () async {
                          final form = _formKey.currentState;
                          if (form != null && form.validate()) {
                            form.save();
                            signIn();
                          }
                        },
                        child: Text('Login'),
                      ),
                    ],
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => registerPage()));
                    },
                    child: Text('Register new gymbro'),
                  )
                ]))));
  }
}
