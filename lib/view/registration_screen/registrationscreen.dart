import 'package:flutter/material.dart';
import 'package:shared_pref_logintask/view/login_screen/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class registrationscreen extends StatefulWidget {
  const registrationscreen({super.key});

  @override
  State<registrationscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<registrationscreen> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Register",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          SizedBox(
            height: 25,
          ),
          TextFormField(
            controller: usernamecontroller,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "enter the username"),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: passwordcontroller,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Enter the password"),
          ),
          ElevatedButton(
              onPressed: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                if (usernamecontroller.text.isNotEmpty &&
                    passwordcontroller.text.isNotEmpty) {
                  prefs.setString("username", usernamecontroller.text);
                  prefs.setString("pass", passwordcontroller.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("enter proper values")));
                }
              },
              child: Text(
                "Register",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.indigo),
              )),
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Loginscreen(),
                    ));
              },
              child: Text(
                "Already have account, Login now",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.indigo),
              ))
        ],
      ),
    );
  }
}
