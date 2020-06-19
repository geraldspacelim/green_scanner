import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_scanner/screens/home/home.dart';
import 'package:green_scanner/screens/rewards/rewards.dart';
import 'package:green_scanner/screens/history/history.dart';


class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int pageIndex = 0;

  // Creating Pages
  final Home _homePage = Home();
  final History _historyPage = new History();
  final Rewards _rewardsPage = new Rewards();

  Widget _showPage = new Home();

  Widget _pageChooser(int page){
    switch(page){
      case 0:
        return _historyPage;
        break;
      case 1:
        return _homePage;
        break;
      case 2:
        return _rewardsPage;
        break;
      default:
        return new Container(
          child: new Center(
            child: new Text(
              "No page Found", style: new TextStyle(fontSize: 30),
            )
          )
        );
    }
  }

  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // FULL SCREEN APP HERE
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.lightGreen,
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.green,
          index: 1,
          height: 50,
          items: <Widget>[
            Icon(Icons.history, size: 20, color: Colors.black),
            Icon(Icons.home, size: 20, color: Colors.black),
            Icon(Icons.account_balance_wallet, size: 20, color: Colors.black),
          ],
          animationDuration: Duration(
              milliseconds: 200
          ),
          animationCurve: Curves.bounceInOut,
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: _showPage,
          ),
        ));
  }
}