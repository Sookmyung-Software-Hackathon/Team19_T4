import 'package:flutter/material.dart';
import 'dart:async';

import 'Login/login.dart';
import 'package:T4/mainBoard/mainBoardPage.dart';
import '/Mypage/mypageMain.dart';
import 'Mypage/mypageEdit.dart';

void main() {
  runApp(new MaterialApp(
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/login': (BuildContext context) => new LoginPage()
    },
  ));
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
            child: Center(
              child: Container(
                // alignment:Alignment.center,
                child: Image.asset('images/Splash.png'),
              ),
            )
        )
    );
  }
}