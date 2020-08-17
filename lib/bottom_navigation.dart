import 'package:flutter/material.dart';

enum TabItem { tab1, tab2, tab3 }

Map<TabItem, String> tabName = {
  TabItem.tab1: 'Tab1',
  TabItem.tab2: 'Tab2',
  TabItem.tab3: 'Tab3',
};

Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.tab1: Colors.red,
  TabItem.tab2: Colors.green,
  TabItem.tab3: Colors.blue,
};

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(tabItem: TabItem.tab1),
        _buildItem(tabItem: TabItem.tab2),
        _buildItem(tabItem: TabItem.tab3),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {
    String text = tabName[tabItem];
    IconData icon = Icons.ac_unit;
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(item: tabItem),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(item: tabItem),
        ),
      ),
    );
  }

  Color _colorTabMatching({TabItem item}) {
    return currentTab == item ? activeTabColor[item] : Colors.grey;
  }
}
