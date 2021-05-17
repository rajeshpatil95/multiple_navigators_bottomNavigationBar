import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({this.color, this.title, this.onPush});
  final MaterialColor color;
  final String title;
  final ValueChanged onPush;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            title,
          ),
          backgroundColor: color,
        ),
        body: GestureDetector(
          onTap: () {
            onPush(context);
          },
          child: Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: Text(
              "Home Page",
              style: TextStyle(
                color: this.color,
              ),
            ),
          ),
        ));
  }
}
