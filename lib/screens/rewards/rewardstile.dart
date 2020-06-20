import 'package:flutter/material.dart';
import 'package:green_scanner/model/reward.dart';
import 'package:green_scanner/screens/rewards/rewards.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../main.dart';

class RewardsTile extends StatefulWidget {
  
  final Reward reward;

  RewardsTile({this.reward});

  @override
  _RewardsTileState createState() => _RewardsTileState();
}

class _RewardsTileState extends State<RewardsTile> {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int score;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getScore();
  }


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
            Column(
                      children: <Widget>[
                        ListTile(
                          leading: Image.asset(
                            widget.reward.imagePath,
                            fit: BoxFit.fitHeight,
                          ),
                            
                          title: Text(widget.reward.title),
                          subtitle: Text(widget.reward.pointsRequired.toString()),                         
                        ),
                        ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {
                                _checkScore(widget.reward.title, widget.reward.pointsRequired);
                              }, 
                              child: Text("Claim Reward"),
                            )
                          ],
                        )
                      ],
                    ),
            
          ]
        ),
      )
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
        score = result;
       // context.read<Score>().updatePage(result);
        print("review score set to $score");
      } else {
        print("failed");
      }
    
  }

  void _checkScore(String reward, int pointsRequired) async {
    await _getScore();
    if (score >= pointsRequired) {
      _claimRewardConfirm(context, reward, pointsRequired);
    } else {
      _insufficientPoints(context);
    }
  }

  _insufficientPoints(context) {
    Alert(
      context: context,
      title: "Unable to claim reward",
      desc: "You have insufficient points to claim this reward.",
      style: alertStyle,
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          color: Colors.green,
          onPressed: () {
            debugPrint("OK Pressed");
            Navigator.pop(context);
          },
          width: 200,
        ),
      ],
    ).show();
  }

  _deductScore(int pointsRequired) async {
    int remainingPoints = score - pointsRequired;
    var url = 'http://greenscanner.azurewebsites.net/update/$remainingPoints';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      //var jsonResponse = convert.jsonDecode(response.body);
      //print(jsonResponse['points'].toString());
      await _getScore();
      context.read<Score>().updatePage(remainingPoints);
      setState(() {
        print('score after deduction is $score');
        
      });
    } else {
      print("failed");
    }
  }

  _claimRewardConfirm(context, String reward, int pointsRequired) {
    Alert(
      context: context,
      title: "Confirm Claim Reward",
      desc: "Claim $reward for $pointsRequired points?",
      style: alertStyle,
      buttons: [
        DialogButton(
          child: Text(
            "Confirm",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          color: Colors.green,
          onPressed: () {
            debugPrint("Confirmed Pressed");
            _deductScore(pointsRequired);
            Navigator.pop(context);
          },
          width: 240,
        ),
        DialogButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          color: Colors.grey,
          onPressed: () {
            Navigator.pop(context);
          },
          width: 240,
        ),
      ],
    ).show();
  }


  var alertStyle = AlertStyle(
    animationType: AnimationType.grow,
    isCloseButton: false,
    isOverlayTapDismiss: true,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
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


  

  

