import 'package:flutter/material.dart';
import 'SignUpPage.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginPage> {
  dynamic getStorage = SharedPreferences.getInstance();
  TextEditingController logUserController = TextEditingController();
  TextEditingController logPassController = TextEditingController();
  String? _name;
  String? _pass;

  Future<String?> getData() async {
    getStorage = await SharedPreferences.getInstance();
    dynamic name = await getStorage.get('username');
    dynamic pass = await getStorage.get('password');
    setState(() {
      _name = name;
      _pass = pass;
    });
  }

  String? answer() {
    if ((_name == logUserController.text) &&
        (_pass == logPassController.text)) {
      return ('Hello, $_name, nice to see you again!');
    } else if ((_name != logUserController.text) |
        (_pass != logPassController.text)) {
      return ('The username or password is incorrect, please try again');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            '',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Center(
                child: Container(
              height: 500,
              width: 350,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20,
                      // spreadRadius: 3,
                      color: Colors.black.withOpacity(0.5))
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(60),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Log in form',
                        style: TextStyle(
                            fontFamily: 'GrapeNuts',
                            fontSize: 45,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        autocorrect: false,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                        cursorHeight: 20,
                        cursorColor: Colors.black,
                        controller: logUserController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.sentiment_satisfied_outlined,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          hintText: 'Username',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      child: TextField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                        cursorHeight: 20,
                        cursorColor: Colors.black,
                        controller: logPassController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.vpn_key_outlined,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          hintText: 'Password',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        fixedSize:
                            MaterialStateProperty.all(const Size(180, 50)),
                        shadowColor: MaterialStateProperty.all(Colors.grey),
                      ),
                      onPressed: () {
                        setState(() {
                          getData();
                        });
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account yet?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return const SignUpPage();
                                }),
                              );
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 90,
                        width: 300,
                        child: (_name != null) & (_pass != null)
                            ? Text('${answer()}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'GrapeNuts',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 27.0,
                                  color: Colors.red,
                                ))
                            : const Text(''),
                      ),
                    ]),
                  ]),
            ))));
  }
}
