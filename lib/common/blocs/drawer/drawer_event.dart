
import 'package:equatable/equatable.dart';

abstract class DrawerEvent extends Equatable{

  @override
  List<Object> get props =>[];
}

class NewLocationOnMapEvent extends DrawerEvent {
  final double latitude;
  final double longitude;

  NewLocationOnMapEvent({required this.latitude, required this.longitude});

  @override
  List<Object> get props => [latitude, longitude];
}