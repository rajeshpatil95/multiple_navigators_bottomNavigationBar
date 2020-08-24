import 'package:flutter/material.dart';
import 'package:multiple_bottomNavigationBar/bottom_navigation.dart';
import 'package:multiple_bottomNavigationBar/views/tab1/home.dart';

class TabNavigator1 extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;
  TabNavigator1({this.navigatorKey, this.tabItem});

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      TabNavigatorRoutes1.root: (context) => HomePage(
          color: activeTabColor[tabItem], title: "BMMI", onPush: (context) {}),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes1.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}

class TabNavigatorRoutes1 {
  static const String root = '/';
}
