import 'package:barcode_scan/barcode_scan.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:green_scanner/model/runnercard.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../login.dart';
import '../../login.dart';
import '../../login.dart';
import '../../main.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<charts.Series<Task,String>> _seriesPieData;

  _generateData(){
    var pieData = [
      new Task("Run", 20, Colors.green),
      new Task("Jump", 80, Colors.black),
    ];

    _seriesPieData.add(
      charts.Series(
        data: pieData,
        domainFn: (Task task,_) => task.task,
        measureFn: (Task task,_) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Daily',
        labelAccessorFn: (Task row,_)=>'${row.taskvalue}',
      )
    );
  }

  @override
  void initState(){
    _updateImage();
    super.initState();
    _seriesPieData = List<charts.Series<Task,String>>();
    _generateData();
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
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          new Text(qrResult),
          Text(context.watch<Score>().score.toString()),
          Text(Provider.of<Score>(context, listen: true).toString()),
          Positioned(
            top: 0,
            height: height * 0.35,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: const Radius.circular(40),
              ),
              child: Container(
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new Image(image: _setImage ?? new AssetImage("assets/real_tree.gif"),),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.38,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                    bottom: 8,
                      left: 32,
                      right: 16,
                    ),
                    child: Text(
                      "Recent Points",
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 32,
                          ),
                          for (int i = 0; i<runnercard.length; i++)
                            _RunnerCard(runnerCard: runnercard[i],)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10, left: 32, right: 32,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0xFF20008B),
                            const Color(0XFF200087),
                          ],
                        )
                      ),
                        child: charts.PieChart(
                          _seriesPieData,
                          animate: true,
                          animationDuration: Duration(milliseconds: 500),
                          behaviors: [
                            new charts.DatumLegend(
                              outsideJustification: charts.OutsideJustification.startDrawArea,
                              horizontalFirst: false,
                              desiredMaxRows: 2,
                              cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                              entryTextStyle: charts.TextStyleSpec(
                                  color: charts.MaterialPalette.purple.shadeDefault,
                                  fontFamily: 'Georgia',
                                  fontSize: 11),
                            )
                          ],
                          defaultRenderer: new charts.ArcRendererConfig(
                              arcWidth: 100,
                              arcRendererDecorators: [
                                new charts.ArcLabelDecorator(
                                    labelPosition: charts.ArcLabelPosition.inside),
                              ]
                          ),
                        ),

                    )
                  )
                ],
              ),
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

class Task{
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task,this.taskvalue,this.colorval);
}

class _RunnerCard extends StatelessWidget {

  final RunnerCard runnerCard;

  const _RunnerCard({Key key, this.runnerCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20,bottom: 10,),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  runnerCard.imagePath,
                  width: 150,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    Text("Points",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.blueGrey
                    ),),
                    Text(runnerCard.points, style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.black,
                    )),
                    Row(
                      children: <Widget>[
                        Icon(Icons.shopping_cart, color: Colors.black12,size: 20,),
                        SizedBox(width: 4,),
                        Text("${runnerCard.items}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.blueGrey,
                        ),)
                      ],
                    ),
                    SizedBox(height:5),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
