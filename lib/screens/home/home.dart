import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String qrResult = "Not Yet";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(qrResult),
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
}
