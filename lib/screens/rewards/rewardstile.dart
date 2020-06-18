import 'package:flutter/material.dart';
import 'package:green_scanner/screens/rewards/rewards.dart';

class RewardsTile extends StatefulWidget {
  
  final Reward reward;

  RewardsTile({this.reward});

  @override
  _RewardsTileState createState() => _RewardsTileState();
}

class _RewardsTileState extends State<RewardsTile> {
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
              leading: widget.reward.image,
              title: Text(widget.reward.title),
              subtitle: Text(widget.reward.pointsRequired.toString()),
              
            ),
          ]
        ),
      )
    );
  }
}