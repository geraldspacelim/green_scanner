import 'package:flutter/material.dart';
import 'package:green_scanner/screens/history/historylist.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          SizedBox(height: 40),
          Text("Previous Purchases"),
          HistoryList(),
        ]
      ),
    );
  }
}

