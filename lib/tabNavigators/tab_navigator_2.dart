import 'package:flutter/material.dart';
import 'package:multiple_bottomNavigationBar/navigation/bottom_navigation.dart';
import 'package:multiple_bottomNavigationBar/presentation/tab2/plp_page.dart';
import 'package:multiple_bottomNavigationBar/presentation/tab2/category_list_page.dart';
import 'package:multiple_bottomNavigationBar/presentation/tab2/sub_category_list_page.dart';

class TabNavigator2 extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;
  TabNavigator2({this.navigatorKey, this.tabItem});

  void _pushSubDetail(BuildContext context) {
    var routeBuilders = _routeBuilders(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            routeBuilders[TabNavigatorRoutes2.subRoot](context),
      ),
    );
  }

  void _pushDetail(BuildContext context, {int catId}) {
    var routeBuilders = _routeBuilders(context, catId: catId);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            routeBuilders[TabNavigatorRoutes2.detail](context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, {int catId}) {
    return {
      TabNavigatorRoutes2.root: (context) => CategoryListPage(
            color: activeTabColor[tabItem],
            title: "BMMI",
            onPush: (context) => _pushSubDetail(context),
          ),
      TabNavigatorRoutes2.subRoot: (context) => SubCategoryListPage(
            color: activeTabColor[tabItem],
            title: "Category L2",
            onPush: (context) => _pushDetail(context, catId: 1000),
          ),
      TabNavigatorRoutes2.detail: (context) => PLPPage(
            color: activeTabColor[tabItem],
            title: "PLP",
            catId: catId,
            onPush: (catId) => _pushDetail(context, catId: catId),
          ),
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
  static const String subRoot = '/subRoot';
  static const String detail = '/detail';
}
