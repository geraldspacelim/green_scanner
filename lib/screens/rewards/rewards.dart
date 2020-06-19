import 'package:flutter/material.dart';
import 'package:green_scanner/screens/rewards/rewardslist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import '../../main.dart';


class Rewards extends StatefulWidget {

  @override
  _RewardsState createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          SizedBox(height: 50),
          Text("Score: "+context.watch<Score>().score.toString()),
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