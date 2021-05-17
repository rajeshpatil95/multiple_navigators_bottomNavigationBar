import 'package:flutter/material.dart';

class WelcomeToFiji extends StatefulWidget {
  @override
  _WelcomeToFijiState createState() => _WelcomeToFijiState();
}

class _WelcomeToFijiState extends State<WelcomeToFiji> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center, child: Text("Welcome to Fiji")),
    );
  }
}
