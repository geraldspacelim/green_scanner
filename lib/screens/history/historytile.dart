import 'package:flutter/material.dart';
import 'package:green_scanner/model/prevpurchase.dart';
import 'package:green_scanner/model/purchase.dart';
import 'package:green_scanner/screens/history/history.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HistoryTile extends StatefulWidget {


  final PrevPurchase prevPurchase;
  HistoryTile({this.prevPurchase});

  @override
  _HistoryTileState createState() => _HistoryTileState();
}

class _HistoryTileState extends State<HistoryTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget> [
            SizedBox(height: 5,),
            ListTile(
              leading: Image.asset(
                widget.prevPurchase.purchase.imagePath,
                height: 200,
                //width: 100,
                fit: BoxFit.fitHeight,
              ),
              title: Text(widget.prevPurchase.purchase.item),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 5),
                  Text("Purchased on: "+widget.prevPurchase.date),
                  Text("Carbon Footprint:"+widget.prevPurchase.purchase.carbonFootprint.toString()),
                  Text("Points Earned:"+widget.prevPurchase.purchase.pointsEarned.toString()),
                ],
              ),
              onTap: () {_showDetails(context, widget.prevPurchase.purchase.productID, widget.prevPurchase.purchase.carbonFootprint);},
            ),
          ]
        ),
      )
    );
  }

  _showDetails(context, String productID, int carbonFootprint) {
    Alert(
      context: context,
      title: '',
      desc: _showDesc(productID, carbonFootprint),
      style: alertStyle,
      buttons: [
        DialogButton(
          child: Text(
            "Close",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          color: Colors.green,
          onPressed: () {
            debugPrint("Close Pressed");
            Navigator.pop(context);
          },
          width: 200,
        ),
      ],
    ).show();
  }

  String _showDesc(String productID, int carbonFootprint) {
    if (productID[0] == 'w') {
      Purchase ave = Purchase().getPurchase("wl1");
      Purchase low = Purchase().getPurchase("wl3");
      int cfDifference;
      if (carbonFootprint >= ave.carbonFootprint) {
        cfDifference = carbonFootprint - ave.carbonFootprint;
        return "The carbon footprint of your purchase is $cfDifference g more than the average carbon footprint for its item. More environmentally friendly brands to purchase would be ${low.item}.";
      } else {
        cfDifference = ave.carbonFootprint - carbonFootprint;
        return "The carbon footprint of your purchase is $cfDifference g more than the average carbon footprint for its item. Good job! The most environmentally friendly brand of this item is ${low.item}.";
      }
    } else if (productID[0] == 'b') {
      Purchase ave = Purchase().getPurchase("b1");
      Purchase low = Purchase().getPurchase("b4");
      int cfDifference;
      if (carbonFootprint >= ave.carbonFootprint) {
        cfDifference = carbonFootprint - ave.carbonFootprint;
        return "The carbon footprint of your purchase is $cfDifference g more than the average carbon footprint for its item. More environmentally friendly brands to purchase would be ${low.item}.";
      } else {
        cfDifference = ave.carbonFootprint - carbonFootprint;
        return "The carbon footprint of your purchase is $cfDifference g more than the average carbon footprint for its item. Good job! The most environmentally friendly brand of this item is ${low.item}.";
      }
    } else if (productID[0] == 'r') {
      Purchase ave = Purchase().getPurchase("r1");
      Purchase low = Purchase().getPurchase("r4");
      int cfDifference;
      if (carbonFootprint >= ave.carbonFootprint) {
        cfDifference = carbonFootprint - ave.carbonFootprint;
        return "The carbon footprint of your purchase is $cfDifference g more than the average carbon footprint for its item. More environmentally friendly brands to purchase would be ${low.item}.";
      } else {
        cfDifference = ave.carbonFootprint - carbonFootprint;
        return "The carbon footprint of your purchase is $cfDifference g more than the average carbon footprint for its item. Good job! The most environmentally friendly brand of this item is ${low.item}.";
      }
    }
  }

  var alertStyle = AlertStyle(
    animationType: AnimationType.grow,
    isCloseButton: false,
    isOverlayTapDismiss: true,
    descStyle: TextStyle(fontWeight: FontWeight.normal),
    animationDuration: Duration(milliseconds: 200),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.black,
    ),
  );

}