import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  dynamic localStoragePass = SharedPreferences.getInstance();
  dynamic localStorageName = SharedPreferences.getInstance();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void saveDataUser() async {
    localStorageName = await SharedPreferences.getInstance();
    await localStorageName.setString(
        'username', usernameController.text.toString());
    await localStorageName.setString(
        'password', passController.text.toString());
  }

  void saveDataPass() async {
    localStoragePass = await SharedPreferences.getInstance();
    await localStoragePass.setString(
        'username', usernameController.text.toString());
    await localStoragePass.setString(
        'password', passController.text.toString());
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
                const Text('Sign up form',
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
                    controller: usernameController,
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
                    controller: passController,
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
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    fixedSize: MaterialStateProperty.all(const Size(180, 50)),
                    shadowColor: MaterialStateProperty.all(Colors.grey),
                  ),
                  onPressed: () {
                    saveDataUser();
                    saveDataPass();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Log in',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
