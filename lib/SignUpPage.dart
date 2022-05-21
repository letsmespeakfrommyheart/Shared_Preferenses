import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String input = "";
  final inputPass = "";
  final inputUserame = "";
  dynamic localStoragePass = SharedPreferences.getInstance();
  dynamic localStorageName = SharedPreferences.getInstance();
  dynamic getStorage = SharedPreferences.getInstance();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void init() async {
    localStoragePass = await SharedPreferences.getInstance();
    localStorageName = await SharedPreferences.getInstance();
  }

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

  void getData() async {
    getStorage = await SharedPreferences.getInstance();
    dynamic name = await getStorage.get('username');
    dynamic pass = await getStorage.get('password');
    print(name);
    print(pass);
  }

  // void setUsername(setUsernameString) async {
  //   final setName = await SharedPreferences.getInstance();
  //   setState(() {
  //     setName.setString('name', setUsernameString);
  //   });
  // }

  // void setPassword(setPasswordString) async {
  //   final setPass = await SharedPreferences.getInstance();
  //   setState(() {
  //     setPass.setString('pass', setPasswordString);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: Center(
        child: Container(
          height: 500,
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: usernameController,
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
                  controller: passController,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      saveDataUser();
                      saveDataPass();

                      // Navigator.pop(context);
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      getData();

                      // Navigator.pop(context);
                    },
                    child: const Text(
                      'Show',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ],
              ),

              // Padding(
              //   padding: EdgeInsets.only(top: 50),
              // ),
              // if (localStorage != null)
              //   Padding(
              //     padding: const EdgeInsets.all(15.0),
              //     child: Text(
              //       "User Logged in!!! ->  Email Id: ${localStorage.get('username')}  Password: ${localStorage.get('password')}",
              //       style: TextStyle(fontSize: 20),
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
