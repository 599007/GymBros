import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/pages/Profile.dart';
import 'package:fluttertest/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertest/Methods.dart';

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
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
        body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
          const SizedBox(height: 50),
          
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Image.asset('assets/logo-no-background.png', height: 180,),
                    ]),

          const SizedBox(height: 50),

            //Username textfield
            
                  Column(
                    children: [
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
                                labelText: 'Email', labelStyle: TextStyle(color: Colors.grey[500]),
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
                      ),

                      const SizedBox(height: 10.0),

                      //Password textfield

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
                              labelText: 'Password', labelStyle: TextStyle(color: Colors.grey[500]), border: InputBorder.none),
                            obscureText: true,
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
                      ),
                    
                      const SizedBox(height: 10.0),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: ElevatedButton(
                          
                          onPressed: () async {
                            final form = _formKey.currentState;
                            if (form != null && form.validate()) {
                              form.save();
                              signIn(context);
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            minimumSize: MaterialStateProperty.all<Size>(Size(400, 60)),
                          ),
                          child: Text('Login'),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25.0),

                   Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey.shade600),
                        ),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text('Register now',
                    style: TextStyle(color: Colors.grey.shade600)),
                  ),
                  
                const SizedBox(height: 50.0),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                        child: Divider(thickness: 1, color: Colors.grey[400]),
                    ),
                                
                    Text('Or Continue With'),
                    Expanded(
                       child: Divider(thickness: 1, color: Colors.grey[400]),
                              )],
                    ),
                  ),
                
                  const SizedBox(height: 25.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Image.asset('assets/google.png', height: 72,),
                    const SizedBox(width: 25.0),
                    Image.asset('assets/apple.png', height: 72,),
                        ],
                      ),
                    ],
                )))));
  }
}
