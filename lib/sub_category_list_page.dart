import 'package:flutter/material.dart';

class SubCategoryListPage extends StatelessWidget {
  SubCategoryListPage({this.color, this.title, this.onPush});
  final MaterialColor color;
  final String title;
  final ValueChanged onPush;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
              "Category L2 --->",
              style: TextStyle(
                color: this.color,
              ),
            ),
          ),
        ));
  }
}
