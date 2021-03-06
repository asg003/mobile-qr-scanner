import 'package:backtoschool/navigation/route_paths.dart';
import 'package:backtoschool/views/QR_scanner_view.dart';
import 'package:backtoschool/views/SSO_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => SSOLoginView());
        break;
      case RoutePaths.QrScanner:
        return MaterialPageRoute(builder: (_) => QRViewExample());
        break;
    }
  }
}
