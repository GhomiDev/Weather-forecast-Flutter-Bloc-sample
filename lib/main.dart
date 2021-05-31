import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_bloc/common/configs/pages_location.dart';

import 'common/blocs/drawer/drawer.dart';
import 'common/blocs/weather/weather.dart';
import 'common/blocs/navigation/navigation.dart';

/// Custom [BlocObserver] which observes all bloc and cubit instances.
class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<NavigationBloc>(
      create: (context) => NavigationBloc(),
    ),
    BlocProvider<DrawerBloc>(
      create: (context) => DrawerBloc(InitialDrawerState()),
    ),
    BlocProvider<WeatherBloc>(
      create: (context) => WeatherBloc(InitialWeatherState()),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {

  final routerDelegate = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        PagesLocation(),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Weather App Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
    );

    // home: SplashPage(),

  }
}
