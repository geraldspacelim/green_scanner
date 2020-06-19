import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:green_scanner/login.dart';
import 'package:green_scanner/widgets/navbar.dart';
import 'package:provider/provider.dart';

import 'login.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Score()),
      ],
      child: MyApp(),
    )
    
  );
}

class Score with ChangeNotifier, DiagnosticableTreeMixin {
  int _score = 0;
  int get score => _score;
  
  void deductScore(int pointsRequired) {
    _score = _score - pointsRequired;
    notifyListeners();
  }

  void increaseScore(int pointsAdded) {
    _score = _score + pointsAdded;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('score', score));
  }

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
