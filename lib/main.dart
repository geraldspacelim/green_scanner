import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:green_scanner/login.dart';
import 'package:green_scanner/model/prevpurchase.dart';
import 'package:green_scanner/model/purchase.dart';
import 'package:green_scanner/widgets/navbar.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'login.dart';

void main() {

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Score()),
        ChangeNotifierProvider(create: (_) => PrevPurchaseList()),
      ],
      child: MyApp(),
    )
    
  );
}

class Score with ChangeNotifier, DiagnosticableTreeMixin {
  int _score = 0;
  int get score => _score;

  void updatePage(int updatedScore) {
    _score = updatedScore;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('score', score));
  }

}

class PrevPurchaseList with ChangeNotifier, DiagnosticableTreeMixin {
  List<PrevPurchase> _prevPurchaseList = [];
  List<PrevPurchase> get prevPurchaseList => _prevPurchaseList;

  void addPurchases(String date, List<dynamic> purchases) {
    for (var purchase in purchases) {
      _prevPurchaseList.add(PrevPurchase(date: date, purchase: Purchase().getPurchase(purchase.toString())));
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty('prevPurchaseList', prevPurchaseList));
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavBar(),
      routes: {
        '/navigator': (context) => NavBar(),
        '/login': (context) => Login(),
      },
    );
  }
}
