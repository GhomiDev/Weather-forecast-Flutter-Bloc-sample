
import 'sub_types/clouds.dart';
import 'sub_types/coord.dart';
import 'sub_types/main.dart';
import 'sub_types/sys.dart';
import 'sub_types/weather.dart';
import 'sub_types/wind.dart';

class WeatherResponseModel {
    String base;
    Clouds clouds;
    int cod;
    Coord coord;
    int dt;
    int id;
    Main main;
    String name;
    Sys sys;
    int timezone;
    int visibility;
    List<Weather> weather;
    Wind wind;

    WeatherResponseModel({this.base, this.clouds, this.cod, this.coord, this.dt, this.id, this.main, this.name, this.sys, this.timezone, this.visibility, this.weather, this.wind});

    factory WeatherResponseModel.fromJson(Map<String, dynamic> json) {
        return WeatherResponseModel(
            base: json['base'], 
            clouds: json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null, 
            cod: json['cod'], 
            coord: json['coord'] != null ? Coord.fromJson(json['coord']) : null, 
            dt: json['dt'], 
            id: json['id'], 
            main: json['main'] != null ? Main.fromJson(json['main']) : null, 
            name: json['name'], 
            sys: json['sys'] != null ? Sys.fromJson(json['sys']) : null, 
            timezone: json['timezone'], 
            visibility: json['visibility'], 
            weather: json['weather'] != null ? (json['weather'] as List).map((i) => Weather.fromJson(i)).toList() : null, 
            wind: json['wind'] != null ? Wind.fromJson(json['wind']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['base'] = this.base;
        data['cod'] = this.cod;
        data['dt'] = this.dt;
        data['id'] = this.id;
        data['name'] = this.name;
        data['timezone'] = this.timezone;
        data['visibility'] = this.visibility;
        if (this.clouds != null) {
            data['clouds'] = this.clouds.toJson();
        }
        if (this.coord != null) {
            data['coord'] = this.coord.toJson();
        }
        if (this.main != null) {
            data['main'] = this.main.toJson();
        }
        if (this.sys != null) {
            data['sys'] = this.sys.toJson();
        }
        if (this.weather != null) {
            data['weather'] = this.weather.map((v) => v.toJson()).toList();
        }
        if (this.wind != null) {
            data['wind'] = this.wind.toJson();
        }
        return data;
    }
}