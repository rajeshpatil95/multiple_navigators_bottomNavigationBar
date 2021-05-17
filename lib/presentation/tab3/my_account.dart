import 'package:flutter/material.dart';
import 'package:multiple_bottomNavigationBar/appStateContainer/state_model.dart';
import 'package:multiple_bottomNavigationBar/navigation/bottom_navigation.dart';
import 'package:scoped_model/scoped_model.dart';

class MyAccountPage extends StatefulWidget {
  final MaterialColor color;
  final String title;
  final ValueChanged onPush;
  MyAccountPage({this.color, this.title, this.onPush});

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  StateModel model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = ScopedModel.of<StateModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: IconButton(
                icon: Icon(
                  Icons.cancel,
                ),
                iconSize: 30,
                color: Colors.white,
                splashColor: Colors.transparent,
                onPressed: () {
                  model.toggle(TabItem.tab1);
                },
              ),
            )
          ],
          title: Text(
            widget.title,
          ),
          backgroundColor: widget.color,
        ),
        body: GestureDetector(
          onTap: () {
            widget.onPush(context);
          },
          child: Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: Text(
              "MyAccountPage",
              style: TextStyle(
                color: this.widget.color,
              ),
            ),
          ),
        ));
  }
}
