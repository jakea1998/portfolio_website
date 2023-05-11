import 'package:app_portfolio/constants/app_constants.dart';
import 'package:app_portfolio/ui/home.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jake Stegeman',
     
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}