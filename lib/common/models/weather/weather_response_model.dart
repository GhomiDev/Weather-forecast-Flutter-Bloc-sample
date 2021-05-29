import 'sub_types/clouds.dart';
import 'sub_types/coord.dart';
import 'sub_types/main.dart';
import 'sub_types/sys.dart';
import 'sub_types/weather.dart';
import 'sub_types/wind.dart';

class WeatherResponseModel {
  String base;
  Clouds? clouds;
  int cod;
  Coord? coord;
  int dt;
  int id;
  Main? main;
  String name;
  Sys? sys;
  int timezone;
  int visibility;
  List<Weather>? weather;
  Wind? wind;

  WeatherResponseModel({
    required this.base,
    required this.clouds,
    required this.cod,
    required this.coord,
    required this.dt,
    required this.id,
    required this.main,
    required this.name,
    required this.sys,
    required this.timezone,
    required this.visibility,
    required this.weather,
    required this.wind,
  });

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) {
    return WeatherResponseModel(
      base: json['base'] as String,
      clouds: json['clouds'] != null ? Clouds.fromJson(json['clouds'] as Map<String, dynamic>) : null,
      cod: json['cod'] as int,
      coord: json['coord'] != null ? Coord.fromJson(json['coord'] as Map<String, dynamic>) : null,
      dt: json['dt'] as int,
      id: json['id'] as int,
      main: json['main'] != null ? Main.fromJson(json['main'] as Map<String, dynamic>) : null,
      name: json['name'] as String,
      sys: json['sys'] != null ? Sys.fromJson(json['sys'] as Map<String, dynamic>) : null,
      timezone: json['timezone'] as int,
      visibility: json['visibility'] as int,
      weather: json['weather'] != null ? (json['weather'] as List).map((i) => Weather.fromJson(i as Map<String, dynamic>)).toList() : null,
      wind: json['wind'] != null ? Wind.fromJson(json['wind'] as Map<String, dynamic>) : null,
    );
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['base'] = base;
    data['cod'] = cod;
    data['dt'] = dt;
    data['id'] = id;
    data['name'] = name;
    data['timezone'] = timezone;
    data['visibility'] = visibility;
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    if (coord != null) {
      data['coord'] = coord!.toJson();
    }
    if (main != null) {
      data['main'] = main!.toJson();
    }
    if (sys != null) {
      data['sys'] = sys!.toJson();
    }
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    return data;
  }
}
