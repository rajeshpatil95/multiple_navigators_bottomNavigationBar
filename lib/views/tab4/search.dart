import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final MaterialColor color;
  final String title;
  final ValueChanged onPush;
  Search({this.color, this.title, this.onPush});

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
              "${this.title}",
              style: TextStyle(
                color: this.color,
              ),
            ),
          ),
        ));
  }
}
