import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: import_of_legacy_library_into_null_safe
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
      navigatorKey: Application.sailor!.navigatorKey,
      onGenerateRoute: Application.sailor!.generator(),
      home: SplashPage(),
    );
  }
}
