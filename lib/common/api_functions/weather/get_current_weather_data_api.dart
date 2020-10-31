import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:weather_forecast_bloc/common/constants/static_values.dart';
import 'package:weather_forecast_bloc/common/models/weather/weather_request_model.dart';
import 'package:weather_forecast_bloc/common/models/weather/weather_response_model.dart';

Future<WeatherResponseModel> getCurrentWeatherDataApi(
    WeatherRequestModel request) async {
  try {
    final url = StaticValues.getCurrentWeatherDataAddress();

    final uri = new Uri.http(
        StaticValues.apiProductionBaseAddress,
        StaticValues.apiCurrentWeatherDataAddress,
        {'q': request.cityName, 'units': 'metric', 'appid': StaticValues.apiAppId});
    const headers = {"Content-Type": "application/json"};

    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      WeatherResponseModel weatherResponseModel =
          new WeatherResponseModel.fromJson(responseJson);
      return weatherResponseModel;
    }
  } on Exception catch (ex) {
    print("$ex");
    return null;
  }
  return null;
}
