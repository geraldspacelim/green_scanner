import 'package:flutter/material.dart';
import 'package:green_scanner/screens/rewards/rewards.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class RewardsTile extends StatefulWidget {
  
  final Reward reward;

  RewardsTile({this.reward});

  @override
  _RewardsTileState createState() => _RewardsTileState();
}

class _RewardsTileState extends State<RewardsTile> {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<int> _score;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _score = _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('score') ?? 0);
    });
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
            FutureBuilder<int>(
            future: _score,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                default:
                  if (snapshot.hasError) {
                    return Text(snapshot.error);
                  } else {
                    int score = snapshot.data;
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: widget.reward.image,
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
                    );
                  }
              }
            }
          ),
            
          ]
        ),
      )
    );
  }

  Future<void> _checkScore(String reward, int pointsRequired) async {
    int score = context.read<Score>().score;
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
            setState(() {
                Provider.of<Score>(context, listen: false).deductScore(pointsRequired);
              });
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