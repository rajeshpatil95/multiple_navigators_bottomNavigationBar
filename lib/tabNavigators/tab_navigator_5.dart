import 'package:flutter/material.dart';
import 'package:multiple_bottomNavigationBar/navigation/bottom_navigation.dart';

class TabNavigator5 extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;
  TabNavigator5({this.navigatorKey, this.tabItem});

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      TabNavigatorRoutes5.root: (context) => Container(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes5.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}

class TabNavigatorRoutes5 {
  static const String root = '/';
}
