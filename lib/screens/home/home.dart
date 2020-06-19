import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:provider/provider.dart';

import '../../login.dart';
import '../../login.dart';
import '../../login.dart';
import '../../main.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _score = _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('score') ?? 0);
    });
  }

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<int> _score;
  int score;

  String qrResult = "Not Yet";

  String _setImage(int score)  {

    if(score > 0 && score < 200){
      new Future.delayed(const Duration(seconds: 2),(){

      });
      return "assets/1f.gif";
    }

    else if (score >= 200 && score < 400){
      return "assets/2f.gif";
    }

    else if (score >= 400 && score < 600){
      return "assets/3f.gif";
    }

    else if (score >= 600 && score < 800){
      return "assets/4f.gif";
    }

    else if (score >= 800 && score < 1000){
      return "assets/5f.gif";
    }

    else if (score >= 1000 && score < 1200){
      return "assets/6f.gif";
    }

    else return "assets/real_tree.gif";

  }

  
  Future<void> _updateScore(int score) async {
    final SharedPreferences prefs = await _prefs;
    int updatedScore = (prefs.getInt('score') ?? 0)+score;
    print(updatedScore);
    setState(() {
      _score = prefs.setInt('score', updatedScore).then((bool success) {
        return updatedScore;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                new Text(qrResult),
                Text(context.watch<Score>().score.toString()),
                Text(Provider.of<Score>(context, listen: true).toString()),
                Image(image: new AssetImage(_setImage(context.watch<Score>().score) ?? "assets/real_tree.gif")),   
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 20,
            child: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Popup Model Box
                _onAlertButtonPressed(context);
              },
            )
          )
        ],
      ),
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.green,
        child: Icon(Icons.camera),
        overlayOpacity: 0.2,
        children: [
          SpeedDialChild(
            child:Icon(Icons.camera_alt),
            label: "Camera",
            onTap: () async {
              var result = await BarcodeScanner.scan();
              _onQrScanned(context, result);
              // setState(() {
              //   qrResult = result.rawContent;
              //   Map<String, dynamic> purchase = jsonDecode(result.rawContent);
              //   print(purchase['pointsEarned']);
              //   _updateScore(purchase['pointsEarned']);
              //   print(result.type); // The result type (barcode, cancelled, failed)
              //   print(result.rawContent); // The barcode content
              //   print(result.format); // The barcode format (as enum)
              //   print(result.formatNote); // If a unknown format was scanned this field contains a note
              // });
            }
          ),
          SpeedDialChild(
            child: Icon(Icons.image),
            label: "Gallery",
            onTap: () => print("2nd")
          ),
        ],
      ),
    );
  }

  // RFlutter_PopUp Dialog
  _onAlertButtonPressed(context) {
    Alert(
      context: context,
      title: "Settings",
      style: alertStyle,
      buttons: [
        DialogButton(
          child: Text(
            "Log Out",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          color: Colors.green,
          onPressed: () {
            debugPrint("Log Out Pressed");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Login()));
          },
          width: 240,
        ),
        DialogButton(
          child: Text(
            "My Account",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          color: Colors.green,
          onPressed: () {
            debugPrint("Account Pressed");
          },
          width: 240,
        ),
      ],
    ).show();
  }

  _onQrScanned(context, var result) {
    Map<String, dynamic> purchase = jsonDecode(result.rawContent);
    String date = purchase['date'];
    int score = purchase['pointsEarned'];
    Alert(
      context: context,
      title: "Submit Purchases",
      desc: "Submitting purchases for $date. You have earned $score points from this purchase.",
      style: alertStyle,
      buttons: [
        DialogButton(
          child: Text(
            "Submit",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          color: Colors.green,
          onPressed: () {
            debugPrint("Submit Pressed");
            setState(() {
                qrResult = result.rawContent;                
                //_updateScore(purchase['pointsEarned']);
                //context.read<Score>().increaseScore(purchase['pointsEarned']);
                Provider.of<Score>(context, listen: false).increaseScore(purchase['pointsEarned']);
                print(result.type); // The result type (barcode, cancelled, failed)
                print(result.rawContent); // The barcode content
                print(result.format); // The barcode format (as enum)
                print(result.formatNote); // If a unknown format was scanned this field contains a note
              });
              Navigator.pop(context);
          },
          width: 240,
        ),
        DialogButton(
          child: Text(
            "cancel",
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
