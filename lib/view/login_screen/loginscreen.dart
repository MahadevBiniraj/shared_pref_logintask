import 'package:flutter/material.dart';
import 'package:shared_pref_logintask/view/home_screen/home_screen.dart';
import 'package:shared_pref_logintask/view/registration_screen/registrationscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
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
            "Login now",
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
                  final savedusername = await prefs.getString("username");
                  final savedpassword = await prefs.getString("pass");
                  if (savedusername == usernamecontroller.text &&
                      savedpassword == passwordcontroller.text) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Homescreen(),
                        ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("wrong password")));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Enter the values")));
                }
              },
              child: Text(
                "Log In",
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
                      builder: (context) => registrationscreen(),
                    ));
              },
              child: Text(
                "Don't have account, register now",
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
