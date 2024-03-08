import 'package:flutter/material.dart';
import 'package:rova_2/views/gst_verification.dart';

Route<dynamic> generateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case GstVerification.appRoute:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const GstVerification(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Text("Page not found"),
        ),
      );
  }
}
