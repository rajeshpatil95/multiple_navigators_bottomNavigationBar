import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_bottomNavigationBar/analytics/analytics_manager.dart';
import 'package:multiple_bottomNavigationBar/analytics/sentry.dart';
import 'package:multiple_bottomNavigationBar/appStateContainer/app_state_container.dart';
import 'package:multiple_bottomNavigationBar/bloc/bloc_observer.dart';
import 'package:multiple_bottomNavigationBar/di/di_initializer.dart';
import 'package:multiple_bottomNavigationBar/main/app.dart';
import 'dart:async';
import 'package:multiple_bottomNavigationBar/native/platform_utils.dart';
import 'package:multiple_bottomNavigationBar/navigation/routes.dart';
import 'package:sentry/sentry.dart';
import 'package:multiple_bottomNavigationBar/navigation/route_initializer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multiple_bottomNavigationBar/generated/l10n.dart';

defaultMain() {
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (PlatformUtils.isInDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };

  runZonedGuarded<Future<void>>(() async {
    DI.initializeDependencies();
    AppAnalyticsManager.init();
    Bloc.observer = MTBlocObserver();
    runApp(MaterialApp(
        theme: ThemeData(),
        localizationsDelegates: [
          Strings.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: Strings.delegate.supportedLocales,
        onGenerateRoute: (settings) {},
        routes: {Routes.fiji: (context) => navigateToFiji()},
        home: StateContainer(child: LaunchApp())));
  }, (Object error, StackTrace stackTrace) async {
    final SentryClient sentry = await Sentry.initSentryClient();
    Sentry.reportError(sentry, error, stackTrace);
  });
}
