import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_bottomNavigationBar/appStateContainer/state_model.dart';
import 'package:multiple_bottomNavigationBar/bloc/fiji/fiji_bloc.dart';
import 'package:multiple_bottomNavigationBar/di/di_initializer.dart';
import 'package:multiple_bottomNavigationBar/navigation/bottom_navigation.dart';
import 'package:multiple_bottomNavigationBar/tabNavigators/tab_navigator_1.dart';
import 'package:multiple_bottomNavigationBar/tabNavigators/tab_navigator_2.dart';
import 'package:multiple_bottomNavigationBar/tabNavigators/tab_navigator_3.dart';
import 'package:multiple_bottomNavigationBar/tabNavigators/tab_navigator_4.dart';
import 'package:multiple_bottomNavigationBar/tabNavigators/tab_navigator_5.dart';
import 'package:multiple_bottomNavigationBar/presentation/tab5/fiji.dart';
import 'package:multiple_bottomNavigationBar/webservice/fiji.dart/fiji_repository.dart';
import 'package:scoped_model/scoped_model.dart';

class LaunchApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LaunchAppState();
}

class LaunchAppState extends State<LaunchApp> {
  StateModel model;

  @override
  void initState() {
    super.initState();
    model = StateModel();
  }

  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.tab1: GlobalKey<NavigatorState>(),
    TabItem.tab2: GlobalKey<NavigatorState>(),
    TabItem.tab3: GlobalKey<NavigatorState>(),
    TabItem.tab4: GlobalKey<NavigatorState>(),
    TabItem.tab5: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == TabItem.tab5) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ScopedModel(
                model: model,
                child: BlocProvider<FijiBloc>(
                  create: (context) => FijiBloc(DI.inject<FijiRepository>()),
                  child: FijiScreen(
                      color: activeTabColor[tabItem],
                      title: "Fiji",
                      onPush: (context) {}),
                ))),
      );
    }

    if (tabItem == model.currentTab) {
      // pop to first route
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => model.currentTab = tabItem);
    }
  }

  Widget _tabNavigator(TabItem tabItem) {
    Widget tabNavigator;
    switch (tabItem) {
      case TabItem.tab1:
        tabNavigator = TabNavigator1(
          navigatorKey: _navigatorKeys[tabItem],
          tabItem: tabItem,
        );
        break;
      case TabItem.tab2:
        tabNavigator = TabNavigator2(
          navigatorKey: _navigatorKeys[tabItem],
          tabItem: tabItem,
        );
        break;
      case TabItem.tab3:
        tabNavigator = TabNavigator3(
          navigatorKey: _navigatorKeys[tabItem],
          tabItem: tabItem,
        );
        break;
      case TabItem.tab4:
        tabNavigator = TabNavigator4(
          navigatorKey: _navigatorKeys[tabItem],
          tabItem: tabItem,
        );
        break;
      case TabItem.tab5:
        tabNavigator = TabNavigator5(
          navigatorKey: _navigatorKeys[tabItem],
          tabItem: tabItem,
        );
        break;
    }

    return tabNavigator;
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: model.currentTab != tabItem,
      child: _tabNavigator(tabItem),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return ScopedModel(
        model: model,
        child: ScopedModelDescendant<StateModel>(
            builder: (context, widget, model) {
          return WillPopScope(
            onWillPop: () async {
              final isFirstRouteInCurrentTab =
                  !await _navigatorKeys[model.currentTab]
                      .currentState
                      .maybePop();
              if (isFirstRouteInCurrentTab) {
                // if not on the 'main' tab
                if (model.currentTab != TabItem.tab1) {
                  // select 'main' tab
                  _selectTab(TabItem.tab1);
                  // back button handled by app
                  return false;
                }
              }
              // let system handle back button if we're on the first route
              return isFirstRouteInCurrentTab;
            },
            child: MaterialApp(
              home: Scaffold(
                body: Stack(children: <Widget>[
                  _buildOffstageNavigator(TabItem.tab1),
                  _buildOffstageNavigator(TabItem.tab2),
                  _buildOffstageNavigator(TabItem.tab3),
                  _buildOffstageNavigator(TabItem.tab4),
                  _buildOffstageNavigator(TabItem.tab5),
                ]),
                bottomNavigationBar: BottomNavigation(
                  currentTab: model.currentTab,
                  onSelectTab: _selectTab,
                ),
              ),
            ),
          );
        }));
  }
}
