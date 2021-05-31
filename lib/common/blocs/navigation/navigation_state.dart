
import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable{

  @override
  List<Object> get props =>[];
}

class InitialNavigationState extends NavigationState {}
class SplashNavigationState extends NavigationState {}
class HomeNavigationState extends NavigationState {}
