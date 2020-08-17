import 'package:flutter/material.dart';
import 'package:multiple_bottomNavigationBar/bottom_navigation.dart';
import 'package:multiple_bottomNavigationBar/plp_page.dart';
import 'package:multiple_bottomNavigationBar/category_list_page.dart';
import 'package:multiple_bottomNavigationBar/sub_category_list_page.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String subRoot = '/subRoot';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  void _pushSubDetail(BuildContext context) {
    var routeBuilders = _routeBuilders(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            routeBuilders[TabNavigatorRoutes.subRoot](context),
      ),
    );
  }

  void _pushDetail(BuildContext context) {
    var routeBuilders = _routeBuilders(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => routeBuilders[TabNavigatorRoutes.detail](context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      TabNavigatorRoutes.root: (context) => CategoryListPage(
            color: activeTabColor[tabItem],
            title: "BMMI",
            onPush: (context) => _pushSubDetail(context),
          ),
      TabNavigatorRoutes.subRoot: (context) => SubCategoryListPage(
            color: activeTabColor[tabItem],
            title: "Category L2",
            onPush: (context) => _pushDetail(context),
          ),
      TabNavigatorRoutes.detail: (context) => PLPPage(
            color: activeTabColor[tabItem],
            title: "PLP",
          ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}
