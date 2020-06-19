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
      new Reward(title: "Reusable Cutlery Set from Wheat Cutlery", pointsRequired: 60, imagePath: "assets/cutleryset.jpg"),
      new Reward(title: "Natural Deodorant from Madara", pointsRequired: 120, imagePath: "assets/deodorant.jpg"),
      new Reward(title: "98% Natural Shampoo from Diane Bonheur", pointsRequired: 150, imagePath: "assets/shampoo.jpg"),
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