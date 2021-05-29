import 'package:bloc/bloc.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sailor/sailor.dart';
import 'package:weather_forecast_bloc/common/configs/application.dart';
import 'package:weather_forecast_bloc/common/configs/routes.dart';

import 'navigation.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  late String currentPage;

  NavigationBloc(NavigationState initialState) : super(initialState);

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is NavigateToSplashEvent) {
      await Application.sailor!.navigate(Routes.splash,
          navigationType: NavigationType.pushReplace,
          transitionDuration: Duration(seconds: 1));
      currentPage = Routes.splash;
    } else if (event is NavigateToHomeEvent) {
      await Application.sailor!.navigate(Routes.home,
          navigationType: NavigationType.pushReplace,
          transitions: [SailorTransition.fade_in],
          transitionDuration: Duration(seconds: 2));
      currentPage = Routes.home;
    }
  }
}