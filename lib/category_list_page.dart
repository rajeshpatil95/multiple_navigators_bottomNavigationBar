import 'package:flutter/material.dart';

class CategoryListPage extends StatelessWidget {
  CategoryListPage({this.color, this.title, this.onPush});
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
              "Category L1 --->",
              style: TextStyle(
                color: this.color,
              ),
            ),
          ),
        ));
  }
}
