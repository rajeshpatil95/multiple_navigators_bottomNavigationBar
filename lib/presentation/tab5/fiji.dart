import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_bottomNavigationBar/appStateContainer/state_model.dart';
import 'package:multiple_bottomNavigationBar/bloc/fiji/fiji_bloc.dart';
import 'package:multiple_bottomNavigationBar/bloc/fiji/fiji_event.dart';
import 'package:multiple_bottomNavigationBar/models/fiji_model.dart';
import 'package:multiple_bottomNavigationBar/navigation/bottom_navigation.dart';
import 'package:scoped_model/scoped_model.dart';

class FijiScreen extends StatefulWidget {
  final MaterialColor color;
  final String title;
  final ValueChanged onPush;
  FijiScreen({this.color, this.title, this.onPush});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<FijiScreen> {
  StateModel model;

  @override
  void initState() {
    super.initState();
    model = ScopedModel.of<StateModel>(context);

    BlocProvider.of<FijiBloc>(context).add(FijiGetEvent());
    BlocProvider.of<FijiBloc>(context).add(FijiPostEvent(fijiModel: FijiModel(
    type: "Island",
    name: "Fiji",
    country: "South Pacific",
    capital: "Mojo",
    currency: "fiji",
    population: "20,000"
    )));

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
                "Welcome to Fiji",
                style: TextStyle(
                  color: this.widget.color,
                ),
              ),
            ),
          )),
    );
  }
}
