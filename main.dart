//import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "nunito"),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //backgroundColor: Color(0xFFFFCCCC),
        backgroundColor: Colors.white,
        body: Container(
          child: loginpage(),
        ),
      ),
    );
  }
}

class loginpage extends StatefulWidget {
  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  int _pageState = 0;
  var _backgroundColor = Colors.white;
  var _headingColor = Color(0xFFB40284A);
  double windowWidth = 0;
  double windowHeight = 0;
  double loginYOffset = 0;
  double loginXOffset = 0;
  double registerYOffset = 0;

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.height;
    windowHeight = MediaQuery.of(context).size.height;
    loginXOffset = windowWidth;
    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFFB40284A);
        loginYOffset = windowHeight;
        registerYOffset = windowHeight;

        break;

      case 1:
        _backgroundColor = Color(0xFFB40284A);
        _headingColor = Colors.white;
        loginYOffset = 150;
        registerYOffset = windowHeight;
        break;
      case 2:
        _backgroundColor = Color(0xFFFFE6FF);
        _headingColor = Color(0xFFB40284A);
        loginYOffset = 150;
        registerYOffset = 150;
        break;
    }
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          color: _backgroundColor,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _pageState = 0;
                    });
                  },
                  child: Container(
                    //padding: EdgeInsets.all(40.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(
                              top: 60, right: 15, left: 15),
                          child: Text(
                            '"THERE ARE SO MANY REASONS TO SMILE"',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: _headingColor, fontSize: 25),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              right: 15, left: 15, bottom: 10, top: 20),
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            "It's ok to feel sad sometimes, but dont forget to embrace the beauty of happiness!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _headingColor,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Center(
                    child: Image.asset("asset/image/couns1.png"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(
                    " So, get started to enter your happy place :)",
                    style: TextStyle(
                        color: _headingColor,
                        fontFamily: "nunito",
                        fontSize: 17),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_pageState != 0) {
                          _pageState = 0;
                        } else {
                          _pageState = 1;
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          right: 27, left: 27, bottom: 25, top: 10),
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xFFB40284A),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          "GET STARTED",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _pageState = 2;
            });
          },
          child: AnimatedContainer(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 800),
            transform: Matrix4.translationValues(0, loginYOffset, 1),
            decoration: BoxDecoration(
              color: Color(0xFFFFEBE6),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _pageState = 1;
            });
          },
          child: AnimatedContainer(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 800),
            transform: Matrix4.translationValues(0, registerYOffset, 1),
            decoration: BoxDecoration(
              color: Color(0xFFFFEBE6),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
          ),
        ),
      ],
    );
  }
}
