import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:sailor/sailor.dart';
import 'package:weather_forecast_bloc/pages/home/home_page.dart';
import 'package:weather_forecast_bloc/pages/splash/splash_page.dart';

Widget splashRouteHandler(
    BuildContext context, BaseArguments arguments, ParamMap paramMap) {
  return SplashPage();
}

Widget homeRouteHandler(
    BuildContext context, BaseArguments arguments, ParamMap paramMap) {
  return HomePage();
}
