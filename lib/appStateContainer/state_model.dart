import 'package:multiple_bottomNavigationBar/navigation/bottom_navigation.dart';
import 'package:scoped_model/scoped_model.dart';

class StateModel extends Model {
  TabItem currentTab;

  StateModel() {
    currentTab = TabItem.tab1;
  }

  void toggle(TabItem tabItem) {
    currentTab = tabItem;
    notifyListeners();
  }
}
