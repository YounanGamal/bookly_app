import 'package:bookly_app/core/routes/page_route_name.dart';
import 'package:bookly_app/features/splash/views/splash_view.dart';
import 'package:flutter/material.dart';

class GeneratorRoutes {
  static Route<dynamic> onGenerator(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(),
        );
    }
  }
}
