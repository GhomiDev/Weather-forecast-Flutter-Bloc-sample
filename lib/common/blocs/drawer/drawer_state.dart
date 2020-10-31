import 'package:equatable/equatable.dart';

abstract class DrawerState extends Equatable {
  const DrawerState();

  @override
  List<Object> get props => [];
}

class InitialDrawerState extends DrawerState {}

class NewLocationOnMapState extends DrawerState {
  final double latitude;
  final double longitude;

  const NewLocationOnMapState(
      {this.latitude, this.longitude});

  @override
  List<Object> get props => [latitude, longitude];
}
