import 'package:flutter/material.dart';

enum TabItem { tab1, tab2, tab3, tab4, tab5 }

Map<TabItem, String> tabName = {
  TabItem.tab1: 'Tab1',
  TabItem.tab2: 'Tab2',
  TabItem.tab3: 'Tab3',
  TabItem.tab4: 'Tab4',
  TabItem.tab5: 'Tab5',
};

Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.tab1: Colors.red,
  TabItem.tab2: Colors.green,
  TabItem.tab3: Colors.blue,
  TabItem.tab4: Colors.purple,
  TabItem.tab5: Colors.brown,
};

class BottomNavigation extends StatelessWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  BottomNavigation({this.currentTab, this.onSelectTab});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(tabItem: TabItem.tab1, iconData: Icons.ac_unit),
        _buildItem(tabItem: TabItem.tab2, iconData: Icons.access_alarm),
        _buildItem(tabItem: TabItem.tab3, iconData: Icons.account_balance),
        _buildItem(tabItem: TabItem.tab4, iconData: Icons.add_a_photo),
        _buildItem(tabItem: TabItem.tab5, iconData: Icons.airline_seat_flat),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem, IconData iconData}) {
    String text = tabName[tabItem];

    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
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
