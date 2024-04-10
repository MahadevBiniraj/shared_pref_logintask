import 'package:flutter/material.dart';
import 'package:shared_pref_logintask/view/login_screen/loginscreen.dart';

import 'package:shared_pref_logintask/view/splash_screen/splashscreen.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Loginscreen(),
    );
  }
}
