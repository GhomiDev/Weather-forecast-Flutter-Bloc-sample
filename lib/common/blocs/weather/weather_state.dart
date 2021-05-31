
import 'package:equatable/equatable.dart';
import 'package:weather_forecast_bloc/common/models/weather/weather_response_model.dart';

abstract class WeatherState extends Equatable{
  WeatherState();

  @override
  List<Object> get props =>[];
}

class InitialWeatherState extends WeatherState {}

class BusyState extends WeatherState {}
class NotBusyState extends WeatherState {}

class WeatherDataReceivedState extends WeatherState {
  final WeatherResponseModel weatherData;

  WeatherDataReceivedState({required this.weatherData});

  @override
  List<Object> get props =>[weatherData];
}

class FailureState extends WeatherState {
  final String error;

  FailureState({required this.error});

  @override
  List<Object> get props => [error];
}