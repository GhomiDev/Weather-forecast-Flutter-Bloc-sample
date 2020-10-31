import 'package:bloc/bloc.dart';
import 'package:mobx/mobx.dart';
import 'package:weather_forecast_bloc/common/api_functions/weather/get_current_weather_data_api.dart';
import 'package:weather_forecast_bloc/common/constants/enums.dart';
import 'package:weather_forecast_bloc/common/constants/static_values.dart';
import 'package:weather_forecast_bloc/common/models/weather/weather_request_model.dart';
import 'package:weather_forecast_bloc/common/models/weather/weather_response_model.dart';

import 'weather.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(WeatherState initialState) : super(initialState);

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if(event is GetWeatherDataEvent){
      yield BusyState();
      StaticValues.weatherResponseModel = null;
      var response = await getCurrentWeatherDataApi(new WeatherRequestModel(cityName: event.cityName));
      if(response!=null){
        StaticValues.weatherResponseModel = response;
        yield WeatherDataReceivedState(weatherData: response);
      }
      else{
        yield FailureState(error: 'Failed fetching weather data!');
      }
      yield NotBusyState();
    }
  }
}