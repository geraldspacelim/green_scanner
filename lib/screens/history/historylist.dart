import 'package:flutter/material.dart';
import 'package:green_scanner/main.dart';
import 'package:green_scanner/model/prevpurchase.dart';
import 'package:green_scanner/model/purchase.dart';
import 'package:green_scanner/screens/history/history.dart';
import 'package:green_scanner/screens/history/historytile.dart';
import 'package:provider/provider.dart';

class HistoryList extends StatefulWidget {
  @override
  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  @override
  Widget build(BuildContext context) {

    // List<PrevPurchase> prevPurchases = [
    //   PrevPurchase(date: "19/06/2020", purchase: Purchase().getPurchase("wl1")),
    //   PrevPurchase(date: "19/06/2020", purchase: Purchase().getPurchase("b2")),
    //   PrevPurchase(date: "19/06/2020", purchase: Purchase().getPurchase("r4"))
    // ];

    List<PrevPurchase> prevPurchases = Provider.of<PrevPurchaseList>(context, listen: true).prevPurchaseList;
    List<PrevPurchase> arrangeList = new List.from(prevPurchases.reversed);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: arrangeList.length,
      itemBuilder: (context, index) {
        return HistoryTile(prevPurchase: arrangeList[index]);
      },
    );
  }
}