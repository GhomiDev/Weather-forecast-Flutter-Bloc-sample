import 'package:bloc/bloc.dart';
import 'navigation.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  late String currentPage;

  NavigationBloc() : super(InitialNavigationState());

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is NavigateToSplashEvent) {
      currentPage = 'splash';
      yield SplashNavigationState();
    } else if (event is NavigateToHomeEvent) {
      currentPage = 'home';
      yield HomeNavigationState();
    }
  }
}