import 'package:flutter/material.dart';
import 'pages/SplashPage.dart';



void main() {
  runApp(Waste2GreenApp());
}

class Waste2GreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}



