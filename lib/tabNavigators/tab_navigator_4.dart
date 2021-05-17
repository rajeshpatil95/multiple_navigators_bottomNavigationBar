import 'package:flutter/material.dart';
import 'package:multiple_bottomNavigationBar/navigation/bottom_navigation.dart';
import 'package:multiple_bottomNavigationBar/presentation/tab4/search.dart';

class TabNavigator4 extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;
  TabNavigator4({this.navigatorKey, this.tabItem});

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      TabNavigatorRoutes4.root: (context) => Search(
          color: activeTabColor[tabItem],
          title: "Search Page",
          onPush: (context) {}),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes4.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}

class TabNavigatorRoutes4 {
  static const String root = '/';
}
