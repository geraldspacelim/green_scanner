import 'package:flutter/material.dart';
import 'package:green_scanner/home.dart';
import 'package:green_scanner/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      routes: {
        '/home': (context) => Home()
      }
    );
  }
}
