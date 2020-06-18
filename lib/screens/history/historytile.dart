import 'package:flutter/material.dart';
import 'package:green_scanner/screens/history/history.dart';

class HistoryTile extends StatefulWidget {

  final Purchase purchase;
  HistoryTile({this.purchase});

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
              leading: widget.purchase.image,
              title: Text(widget.purchase.item),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 5),
                  Text("Carbon Footprint:"+widget.purchase.carbonFootprint.toString()),
                  Text("Points Earned:"+widget.purchase.pointsEarned.toString()),
                ],
              ),
              
            ),
          ]
        ),
      )
    );
  }
}