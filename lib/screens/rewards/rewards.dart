import 'package:flutter/material.dart';
import 'package:green_scanner/screens/rewards/rewardslist.dart';


class Rewards extends StatefulWidget {

  int points = 100;
  Rewards({this.points});

  @override
  _RewardsState createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {

  int points = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          SizedBox(height: 50),
          Text('Points: $points'),
          SizedBox(height: 20),
          RewardsList(),
        ]
      ),
    );
  }
}

class Reward {
  final String title;
  final int pointsRequired;
  final Icon image;

  Reward({this.title, this.pointsRequired, this.image});
}