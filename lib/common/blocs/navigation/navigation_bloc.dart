import 'package:beamer/beamer.dart';
import 'package:bloc/bloc.dart';
import 'navigation.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  late String currentPage;

  NavigationBloc() : super(InitialNavigationState());

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is NavigateToSplashEvent) {
      currentPage = 'splash';
      Beamer.of(event.context).beamToNamed('splash');
    } else if (event is NavigateToHomeEvent) {
      currentPage = 'home';
      Beamer.of(event.context).beamToNamed('home');
    }
  }
}