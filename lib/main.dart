import 'package:flutter/material.dart';
import 'package:green_scanner/login.dart';
import 'package:green_scanner/widgets/navbar.dart';

import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavBar(),
      routes: {
        '/navigator': (context) => NavBar(),
        '/login': (context) => Login(),
      },
    );
  }
}
