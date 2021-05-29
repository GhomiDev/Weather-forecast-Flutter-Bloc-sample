
import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable{

  @override
  List<Object> get props =>[];
}

class GetWeatherDataEvent extends WeatherEvent{
  final String cityName;

  GetWeatherDataEvent({required this.cityName});

  @override
  List<Object> get props =>[cityName];
}
