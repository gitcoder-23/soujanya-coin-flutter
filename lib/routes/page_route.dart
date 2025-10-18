import 'package:flutter/material.dart';

import '../pages/home_screen/dashboard_screen.dart';
import '../pages/login/login_screen.dart';

class PageRoutes {
  static final Map<String, String> _routes = {
    'loginScreen': loginScreen,
    'dashboardScreen': dashboardScreen,
  };

  static String? getRoute(String name) => _routes[name];

  static const String loginScreen = LoginScreen.pageName;
  static const String dashboardScreen = DashboardScreen.pageName;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case dashboardScreen:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());

      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
