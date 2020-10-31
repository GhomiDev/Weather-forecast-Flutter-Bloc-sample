import 'package:flutter/material.dart';
import 'package:sailor/sailor.dart';
import './route_handlers.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String splash = "/splash";

  static void configureRoutes(Sailor sailor) {
    sailor.addRoutes([
      SailorRoute(
          name: splash,
          builder: (context, args, paramMap) =>
              splashRouteHandler(context, args, paramMap)),
      SailorRoute(
          name: home,
          builder: (context, args, paramMap) =>
              homeRouteHandler(context, args, paramMap)),
    ]);
  }
}
