import 'dart:convert';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:green_scanner/constants/constants.dart';
import 'package:green_scanner/model/purchase.dart';
import 'package:green_scanner/model/runnercard.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:provider/provider.dart';
import 'package:vector_math/vector_math_64.dart' as math;

import '../../login.dart';
import '../../main.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _RadialProgress extends StatelessWidget {

  final double height, width,progress;

  const _RadialProgress({Key key, this.height, this.width, this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(progress: 0.7),
      child: Container(
        height: height,
        width: width,
        child: Align(
          alignment: Alignment.center,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(text: "1600g", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                )),
                TextSpan(text: "\n"),
                TextSpan(text: "CO2 Saved", style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                )),
              ]
            ),
          ),
        ),
      ),
    );
  }
}

class _RadialPainter extends CustomPainter{

  final double progress;

  _RadialPainter({this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..strokeWidth = 10..color=Color(0xFF200087)..style=PaintingStyle.stroke..strokeCap=StrokeCap.round;

    Offset center = Offset(size.width/2,size.height/2);
    double relativeProgress = 360 * progress;

    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width/2), math.radians(-90), math.radians(-relativeProgress), false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: Stack(
        children: <Widget>[
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
                  Text(
                      "Score: ${context.watch<Score>().score.toString()}",
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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
                      height: 190,
                      width: 400,
                      margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                         // SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              _RadialProgress(
                                width: width * 0.25,
                                height: width * 0.25,
                                progress: 0.3,
                              ),
                              SizedBox(width: 5,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  _ProgressBar(category: "Food", progress: 0.3, progressColor: Colors.green, leftAmount: 200,width: width * 0.35,),
                                  SizedBox(height: 5,),
                                  _ProgressBar(category: "Transport", progress: 0.5, progressColor: Colors.yellow, leftAmount: 100,width: width * 0.35,),
                                  SizedBox(height: 5,),
                                  _ProgressBar(category: "Products", progress: 0.8, progressColor: Colors.redAccent, leftAmount: 500,width: width * 0.35,),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0xFFB5E670),
                            const Color(0XFF579A22),
                          ],
                        )
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
        backgroundColor: Constants.dimGreen,
        child: Icon(Icons.camera),
        overlayOpacity: 0.5,
        children: [
          SpeedDialChild(
            child:Icon(Icons.camera_alt),
            backgroundColor: Constants.fabMicro,
            label: "Camera",
            onTap: () async {
              var result = await BarcodeScanner.scan();
              print(result.rawContent); // The barcode content
              _onQrScanned(context, result);
              // setState(() {
              //   qrResult = result.rawContent;
              //   print(result.type); // The result type (barcode, cancelled, failed)
              //   print(result.rawContent); // The barcode content
              //   print(result.format); // The barcode format (as enum)
              //   print(result.formatNote); // If a unknown format was scanned this field contains a note
              // });
            }
          ),
          SpeedDialChild(
              backgroundColor: Constants.fabMicro,
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
          color: Constants.dimGreen,
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
          color: Constants.dimGreen,
          onPressed: () {
            debugPrint("Account Pressed");
          },
          width: 240,
        ),
      ],
    ).show();
  }

  _onQrScanned(context, var result) {
    Map<String, dynamic> receipt = jsonDecode(result.rawContent);
    String date = receipt['date'];
    List purchasesList = receipt['purchasesList']; // String of all the purchase IDs in the receipt
    print(purchasesList.runtimeType);
    final purchases = Purchase(); // access purchases database
    int totalScore = 0;
    for (var productID in purchasesList) { // 'pulling' relevant data from  database
      print("this receipt contains ${productID.toString()}");
      Purchase purchaseSelected = purchases.getPurchase(productID.toString());
      totalScore = totalScore + purchaseSelected.pointsEarned;
    }
    Alert(
      context: context,
      title: "Submit Purchases",
      desc: "Submitting purchases for $date. You have earned $totalScore points from this purchase.",
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
                Provider.of<Score>(context, listen: false).increaseScore(totalScore);
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

class _ProgressBar extends StatelessWidget {
  final String category;
  final double leftAmount;
  final double progress, width;
  final Color progressColor;

  const _ProgressBar({Key key, this.category, this.leftAmount, this.progress, this.progressColor, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(category.toUpperCase(), style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 10,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.black12,
                        ),
                    ),
                Container(
                  height: 10,
                  width: width * progress,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: progressColor,
                  ),
                ),
              ],
            ),
            SizedBox(width: 3),
            Text("${leftAmount}g left")
          ],
        )
      ],
    );
  }
}
