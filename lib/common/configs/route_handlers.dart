import 'package:flutter/material.dart';

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
