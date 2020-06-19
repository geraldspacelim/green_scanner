import 'package:flutter/material.dart';
import 'package:green_scanner/model/reward.dart';
import 'package:green_scanner/screens/rewards/rewards.dart';
import 'package:green_scanner/screens/rewards/rewardstile.dart';

class RewardsList extends StatefulWidget {
  @override
  _RewardsListState createState() => _RewardsListState();
}

class _RewardsListState extends State<RewardsList> {
  @override
  Widget build(BuildContext context) {

    // List of rewards
    List<Reward> rewards = [
      new Reward(title: "5SGD Starbucks Voucher", pointsRequired: 60, image: Icon(Icons.local_drink)),
      new Reward(title: "Free GV Movie Ticket", pointsRequired: 120, image: Icon(Icons.movie)),
      new Reward(title: "10SGD Capitaland Voucher", pointsRequired: 150, image: Icon(Icons.shopping_cart)),
    ];

    return ListView.builder(
      shrinkWrap: true,
      itemCount: rewards.length,
      itemBuilder: (context, index) {
        return RewardsTile(reward: rewards[index]);
      },
    );
  }
}