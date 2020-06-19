import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../login.dart';
import '../../login.dart';
import '../../login.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState(){
    _updateImage();
    super.initState();
  }

  String qrResult = "Not Yet";
  AssetImage _setImage;
  int score = 900;

  void _updateImage() {
    setState(() {
      if(score > 0 && score < 200){
        _setImage = new AssetImage("assets/1f.gif");

        new Future.delayed(const Duration(milliseconds: 2000), () {
          setState(() {
            _setImage = new AssetImage("assets/1s.gif");
          });
        });
      }

      else if (score >= 200 && score < 400){
        _setImage = new AssetImage("assets/2f.gif");

        new Future.delayed(const Duration(milliseconds: 2000), () {
          setState(() {
            _setImage = new AssetImage("assets/2s.gif");
          });
        });
      }

      else if (score >= 400 && score < 600){
        _setImage = new AssetImage("assets/3f.gif");

        new Future.delayed(const Duration(milliseconds: 2000), () {
          setState(() {
            _setImage = new AssetImage("assets/3s.gif");
          });
        });
      }

      else if (score >= 600 && score < 800){
        _setImage = new AssetImage("assets/4f.gif");

        new Future.delayed(const Duration(milliseconds: 2000), () {
          setState(() {
            _setImage = new AssetImage("assets/4s.gif");
          });
        });
      }

      else if (score >= 800 && score < 1000){
        _setImage = new AssetImage("assets/5f.gif");

        new Future.delayed(const Duration(milliseconds: 2000), () {
          setState(() {
            _setImage = new AssetImage("assets/5s.gif");
          });
        });
      }

      else if (score >= 1000 && score < 1200){
        _setImage = new AssetImage("assets/6f.gif");

        new Future.delayed(const Duration(milliseconds: 2000), () {
          setState(() {
            _setImage = new AssetImage("assets/6s.gif");
          });
        });
      }

      else _setImage = new AssetImage("assets/real_tree.gif");
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
                new Image(image: _setImage ?? new AssetImage("assets/real_tree.gif")),
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
              setState(() {
                qrResult = result.rawContent;
                print(result.type); // The result type (barcode, cancelled, failed)
                print(result.rawContent); // The barcode content
                print(result.format); // The barcode format (as enum)
                print(result.formatNote); // If a unknown format was scanned this field contains a note
              });
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
