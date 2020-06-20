import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_scanner/widgets/navbar.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = '';
  String password = ''; 
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Form(
              child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/background.png'),
                      fit: BoxFit.fill
                    )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: (
                          Container(
                            height: 350,
                            child: Center(
                              child: Text(
                                "Green Scanner", 
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          )
                        ),
                      ),
                      Positioned(
                        child: (
                          Container(
                            margin: EdgeInsets.only(top:80),
                            child: Center(
                              child: Text(
                                "Doing My Part For The World",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  letterSpacing: 1.0 
                                ),
                              ),
                            ),
                          )
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5), 
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(54, 9, 109, .15),
                              blurRadius: 20.0,
                              offset: Offset(0, 10)
                            )
                          ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey[100])
                                ),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Username",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400]
                                  )
                                ),
                                onChanged: (val) {
                                  setState(() => username = val); 
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400]
                                  )
                                ),
                                obscureText: true,
                                onChanged: (val) {
                                  setState(() => password = val); 
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 50.0),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                          ),
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(56, 239, 125, 0.6),
                                Color.fromRGBO(17, 153, 142, 1),
                              ]
                            )
                          ),
                            child: Center(
                            child: Text(
                              "Login", 
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        onPressed: ()  {
                          if (username == "username" && password == "password") {
                            Navigator.pop(context);
                            // Navigator.pushReplacementNamed(context, '/navigator');
                          }
                        }
                      ),
                      SizedBox(height: 10),
                      FlatButton(
                        child: Text(
                          "Don't Have an Account? Sign Up Here!",
                          style: TextStyle(
                            color: Color.fromRGBO(17, 153, 142, 1),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      )
    );
  }
}