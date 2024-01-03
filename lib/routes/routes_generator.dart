import 'package:flutter/material.dart';

import '../login/login_screen.dart';
import '../registration/registration_screen.dart';
import '../splash/splash_screen.dart';


class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final arg = settings.arguments;

    switch (settings.name) {

      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case MyLogin.routeName:
        return MaterialPageRoute(builder: (_) => const MyLogin());

      case MyRegister.routeName:
        return MaterialPageRoute(builder: (_) => const MyRegister());

      default:
        return _onPageNotFound();
    }
  }

  static Route<dynamic> _onPageNotFound() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(body: Text("Page not found")),
    );
  }
}