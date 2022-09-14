import 'package:coronavirus_app/View/countries_list_screen.dart';
import 'package:coronavirus_app/resources/stringmanager.dart';
import 'package:flutter/material.dart';

import '../View/splashscreen.dart';
import '../View/worldrecord_statses.dart';

class Routes {
  static const String splashscreen = '/';
  static const String worldstats = 'worldstats';
  static const String countrylist = 'country';
}

class RoutGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case Routes.splashscreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.worldstats:
        return MaterialPageRoute(
          builder: (_) => const WorldrecordStates(),
        );
      case Routes.countrylist:
        return MaterialPageRoute(
          builder: (_) => const CountriesListScreen(),
        );

      default:
        return undefinedNameRoute();
    }
  }

  static Route<dynamic> undefinedNameRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
              body: Text(AppStrings.noRoute),
            ));
  }
}
