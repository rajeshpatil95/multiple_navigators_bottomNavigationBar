

import 'package:multiple_bottomNavigationBar/analytics/analytics_manager.dart';
import 'package:multiple_bottomNavigationBar/analytics/event.dart';

class EventLogger {
  static void logEvent(String eventName, Map<String, String> params) {
    AppAnalyticsManager()
        .addEvent(AppAnalyticsEvent.withParams(eventName, params));
  }

  void logException(Exception e) {
    // Exceptions will be logged automatically using reporting tools. Anything to do here?
  }
}
