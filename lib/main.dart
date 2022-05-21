import 'package:flutter/material.dart';
import 'SignUpPage.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  const LoginDemo({Key? key}) : super(key: key);
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  dynamic getName = SharedPreferences.getInstance();
  dynamic getPass = SharedPreferences.getInstance();
  TextEditingController logUserController = TextEditingController();
  TextEditingController logPassController = TextEditingController();
  String inputUserName = "";
  String inputPass = "";
  var name = "";
  var pass = "";

  // void getUsername() async {
  //   final getName = await SharedPreferences.getInstance();
  //   setState(() {
  //     var userName = getName.getString('name');
  //     print(userName);
  //   });
  // }

  Future getDataName() async {
    getName = await SharedPreferences.getInstance();
    String name = await getName.getString('username');
    return name;
  }

  Future getDataPass() async {
    getPass = await SharedPreferences.getInstance();
    String pass = await getPass.getString('password');
    return pass;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Center(
        child: Container(
          height: 500,
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: logUserController,
                  onSubmitted: (dynamic input) {
                    inputUserName = input;
                    setState(() {
                      print(inputUserName);
                    });
                  },
                  // onSubmitted: (String inputUsername) {
                  //   input = inputUsername;
                  //   setState(() {
                  //     setUsername();
                  //     print(input);
                  //   });
                  // },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: logPassController,
                  onSubmitted: (dynamic input) {
                    inputPass = input;
                    setState(() {
                      print(inputPass);
                    });
                  },
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      print(name);
                      print(pass);
                      if ((name == inputUserName) & (pass == inputPass)) {
                        print('Ura!!');
                      } else if (name != inputUserName) {
                        print('Repeat UserName');
                      } else if (pass != inputPass) {
                        print('Repeat Password');
                      }
                    });
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SignUpPage()));
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
