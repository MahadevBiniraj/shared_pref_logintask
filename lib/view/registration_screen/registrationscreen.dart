import 'package:flutter/material.dart';

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
              onPressed: () {},
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
              onPressed: () {},
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
