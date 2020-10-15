//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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
  double loginOpacity = 1;
  double registerYOffset = 0;
  double loginHeight = 0;
  double registerHeight = 0;

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.height;
    windowHeight = MediaQuery.of(context).size.height;
    loginHeight = windowHeight - 150;
    registerHeight = windowHeight - 150;

    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFFB40284A);
        loginYOffset = windowHeight;
        registerYOffset = windowHeight;
        loginOpacity = 1;

        break;

      case 1:
        _backgroundColor = Color(0xFFB40284A);
        _headingColor = Colors.white;
        loginYOffset = 150;
        registerYOffset = windowHeight;
        loginOpacity = 1;
        break;
      case 2:
        _backgroundColor = Color(0xFFFFE6FF);
        _headingColor = Color(0xFFB40284A);
        loginYOffset = 150;
        registerYOffset = 150;
        loginOpacity = 0.7;
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
            padding: EdgeInsets.all(20),
            height: loginHeight,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 800),
            transform: Matrix4.translationValues(0, loginYOffset, 1),
            decoration: BoxDecoration(
              color: Color(0xFFFFEBE6).withOpacity(loginOpacity),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 30, top: 20),
                      child: Text(
                        "Login to continue",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    InputWithIcon(
                        icon: Icons.email, hint: "enter registered email"),
                    SizedBox(
                      height: 25,
                    ),
                    InputWithIcon(icon: Icons.vpn_key, hint: "enter password"),
                  ],
                ),
                Column(
                  children: <Widget>[
                    PrimaryButton(
                      btnText: "login",
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _pageState = 2;
                        });
                      },
                      child: OutlineBtn(
                        btnText: "create new account",
                      ),
                    ),
                  ],
                ),
              ],
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
            height: registerHeight,
            padding: EdgeInsets.all(20),
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 800),
            transform: Matrix4.translationValues(0, registerYOffset, 1),
            decoration: BoxDecoration(
              color: Color(0xFFCCCCFF),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "create new account",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    InputWithIcon(
                      icon: Icons.email,
                      hint: "enter email",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InputWithIcon(icon: Icons.vpn_key, hint: "enter password"),
                    SizedBox(
                      height: 20,
                    ),
                    InputWithIcon(
                        icon: Icons.phone_android,
                        hint: "enter emergency contact"),
                  ],
                ),
                Column(
                  children: <Widget>[
                    PrimaryButton(
                      btnText: "sign up",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _pageState = 1;
                        });
                      },
                      child: OutlineBtn(
                        btnText: "return to login page",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class InputWithIcon extends StatefulWidget {
  final IconData icon;
  final String hint;
  InputWithIcon({this.icon, this.hint});
  @override
  _InputWithIconState createState() => _InputWithIconState();
}

class _InputWithIconState extends State<InputWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFBC7C7C7), width: 2),
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            child: Icon(
              widget.icon,
              size: 25,
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: InputBorder.none,
                hintText: widget.hint,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PrimaryButton extends StatefulWidget {
  final String btnText;
  PrimaryButton({this.btnText});
  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, left: 20),
      decoration: BoxDecoration(
          color: Color(0xFFB40284A), borderRadius: BorderRadius.circular(30)),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}

class OutlineBtn extends StatefulWidget {
  final String btnText;
  OutlineBtn({this.btnText});

  @override
  _OutlineBtnState createState() => _OutlineBtnState();
}

class _OutlineBtnState extends State<OutlineBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Color(0xFFB40284A), borderRadius: BorderRadius.circular(30)),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
