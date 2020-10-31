import 'package:bloc/bloc.dart';
import 'package:sailor/sailor.dart';
import 'package:weather_forecast_bloc/common/configs/application.dart';
import 'package:weather_forecast_bloc/common/configs/routes.dart';

import 'navigation.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  String currentPage;

  NavigationBloc(NavigationState initialState) : super(initialState);

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is NavigateToSplashEvent) {
      Application.sailor.navigate(Routes.splash,
          navigationType: NavigationType.pushReplace,
          transitionDuration: Duration(seconds: 1));
      this.currentPage = Routes.splash;
    } else if (event is NavigateToHomeEvent) {
      Application.sailor.navigate(Routes.home,
          navigationType: NavigationType.pushReplace,
          transitions: [SailorTransition.fade_in],
          transitionDuration: Duration(seconds: 2));
      this.currentPage = Routes.home;
    }
  }
}