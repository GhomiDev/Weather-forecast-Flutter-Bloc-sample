import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_bloc/common/blocs/navigation/navigation.dart';
import 'package:weather_forecast_bloc/pages/home/home_page.dart';
import 'package:weather_forecast_bloc/pages/splash/splash_page.dart';

class PagesLocation extends BeamLocation {
  PagesLocation() : super() {
    addListener(_listener);
  }

  final NavigationBloc _navigationBloc = NavigationBloc();

  void _listener() {
    if (state.pathBlueprintSegments.isEmpty) return;

  }

  @override
  Widget builder(BuildContext context, Widget navigator) {
    return BlocProvider.value(
      value: _navigationBloc,
      child: navigator,
    );
  }

  @override
  List<String> get pathBlueprints => ['/home'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
    BeamPage(
      key: ValueKey('splash'),
      title: 'Splash',
      child: SplashPage(),
    ),
    if (state.uri.pathSegments.contains('home'))
      BeamPage(
        key: ValueKey('home'),
        title: 'Home',
        child: HomePage(),
      ),
  ];
}