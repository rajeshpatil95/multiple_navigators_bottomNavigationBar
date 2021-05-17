import 'package:flutter/material.dart';
import 'package:multiple_bottomNavigationBar/appStateContainer/state_model.dart';
import 'package:multiple_bottomNavigationBar/navigation/bottom_navigation.dart';
import 'package:scoped_model/scoped_model.dart';

class CartPage extends StatefulWidget {
  final MaterialColor color;
  final String title;
  final ValueChanged onPush;
  CartPage({this.color, this.title, this.onPush});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  StateModel model;

  @override
  void initState() {
    super.initState();
    model = ScopedModel.of<StateModel>(context);
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    model.toggle(TabItem.tab1);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              widget.title,
            ),
            backgroundColor: widget.color,
          ),
          body: GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: Text(
                "CartPage",
                style: TextStyle(
                  color: this.widget.color,
                ),
              ),
            ),
          )),
    );
  }
}
