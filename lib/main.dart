import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sailor/sailor.dart';

import 'common/blocs/drawer/drawer.dart';
import 'common/blocs/weather/weather.dart';
import 'common/blocs/navigation/navigation.dart';
import 'common/configs/application.dart';
import 'common/configs/routes.dart';
import 'pages/splash/splash_page.dart';

/// Custom [BlocObserver] which observes all bloc and cubit instances.
class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    print(change);
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(cubit, error, stackTrace);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<NavigationBloc>(
      create: (context) => NavigationBloc(InitialNavigationState()),
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
  MyApp() {
    final sailor = Sailor();
    Routes.configureRoutes(sailor);
    Application.sailor = sailor;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: Application.sailor.navigatorKey,
      onGenerateRoute: Application.sailor.generator(),
      home: SplashPage(),
    );
  }
}
