
class Main {
    // ignore: non_constant_identifier_names
    var feels_like;
    int humidity;
    int pressure;
    var temp;
    // ignore: non_constant_identifier_names
    var temp_max;
    // ignore: non_constant_identifier_names
    var temp_min;

    // ignore: non_constant_identifier_names
    Main({required this.feels_like, required this.humidity, required this.pressure, this.temp, this.temp_max, this.temp_min});

    factory Main.fromJson(Map<String, dynamic> json) {
        return Main(
            feels_like: json['feels_like'], 
            humidity: json['humidity'] as int,
            pressure: json['pressure'] as int,
            temp: json['temp'], 
            temp_max: json['temp_max'], 
            temp_min: json['temp_min'], 
        );
    }

    Map<String, dynamic> toJson() {
        final data = <String, dynamic>{};
        data['feels_like'] = feels_like;
        data['humidity'] = humidity;
        data['pressure'] = pressure;
        data['temp'] = temp;
        data['temp_max'] = temp_max;
        data['temp_min'] = temp_min;
        return data;
    }
}