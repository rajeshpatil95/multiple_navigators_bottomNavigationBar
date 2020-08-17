import 'package:flutter/material.dart';

class PLPPage extends StatelessWidget {
  PLPPage({this.color, this.title, this.materialIndex: 500});
  final MaterialColor color;
  final String title;
  final int materialIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(
          '$title',
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          "PLP",
          style: TextStyle(
            color: this.color,
          ),
        ),
      ),
    );
  }
}
