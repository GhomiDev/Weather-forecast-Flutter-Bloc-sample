import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class NavigationEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class NavigateToSplashEvent extends NavigationEvent {
  final BuildContext context;
  NavigateToSplashEvent(this.context);
}

class NavigateToHomeEvent extends NavigationEvent {
  final BuildContext context;
  NavigateToHomeEvent(this.context);
}
