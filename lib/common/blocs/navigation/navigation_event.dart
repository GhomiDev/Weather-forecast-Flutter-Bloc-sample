
import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable{

  @override
  List<Object> get props =>[];
}

class NavigateToSplashEvent extends NavigationEvent {}
class NavigateToHomeEvent extends NavigationEvent {}
