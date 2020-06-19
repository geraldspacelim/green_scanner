import 'package:flutter/material.dart';
import 'package:green_scanner/model/purchase.dart';
import 'package:green_scanner/screens/history/history.dart';
import 'package:green_scanner/screens/history/historytile.dart';

class HistoryList extends StatefulWidget {
  @override
  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  @override
  Widget build(BuildContext context) {
    // List of rewards
    List<Purchase> purchases = [
      Purchase().getPurchase("wl1"),
      Purchase().getPurchase("b2"),
      Purchase().getPurchase("r4"),
    ];

    return ListView.builder(
      shrinkWrap: true,
      itemCount: purchases.length,
      itemBuilder: (context, index) {
        return HistoryTile(purchase: purchases[index]);
      },
    );
  }
}