import 'package:flutter/material.dart';
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
      new Purchase(item: "Whole Milk, One Pint", carbonFootprint: 900, pointsEarned: 30, image: Icon(Icons.local_drink)),
      new Purchase(item: "Orange Juice", carbonFootprint: 360, pointsEarned: 60, image: Icon(Icons.local_drink)),
      new Purchase(item: "Washing Liquid", carbonFootprint: 900, pointsEarned: 10, image: Icon(Icons.local_laundry_service)),
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