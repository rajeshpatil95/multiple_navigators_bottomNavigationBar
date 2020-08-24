import 'package:flutter/material.dart';
import 'package:multiple_bottomNavigationBar/bottom_navigation.dart';
import 'package:multiple_bottomNavigationBar/views/tab3/my_account.dart';

class TabNavigator3 extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;
  TabNavigator3({this.navigatorKey, this.tabItem});

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      TabNavigatorRoutes2.root: (context) => MyAccountPage(
          color: activeTabColor[tabItem],
          title: "My Account",
          onPush: (context) {}),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes2.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}

class TabNavigatorRoutes2 {
  static const String root = '/';
}
