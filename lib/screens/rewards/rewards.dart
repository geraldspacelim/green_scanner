import 'package:flutter/material.dart';
import 'package:green_scanner/screens/rewards/rewardslist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../main.dart';


class Rewards extends StatefulWidget {

  @override
  _RewardsState createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {

  int score;

  @override
  void initState() {
    // TODO: implement initState

    _getScore();
    super.initState();
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          SizedBox(height: 50),
          Text("Score: ${context.watch<Score>().score} ",
            style: const TextStyle(
              fontFamily: 'BalsamiqSans',
              fontWeight: FontWeight.w800,
              fontSize: 30,
            ),
          ),
          SizedBox(height: 20),
          RewardsList(),
        ]
      ),
    );
  }

  _getScore() async {
    var url = 'http://greenscanner.azurewebsites.net/users/username';
    var response = await http.get(url);
    if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        print(jsonResponse['points'].toString());
        int result = jsonResponse['points'];
        print("result is $result");
        context.read<Score>().updatePage(result);
        setState(() { 
        });
      } else {
        print("failed");
      }
    
  }
}

