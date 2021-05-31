
class Sys {
    String country;
    int id;
    int sunrise;
    int sunset;
    int type;

    Sys({required this.country, required this.id, required this.sunrise, required this.sunset, required this.type});

    factory Sys.fromJson(Map<String, dynamic> json) {
        return Sys(
            country: json['country'] as String,
            id: json['id'] as int,
            sunrise: json['sunrise'] as int,
            sunset: json['sunset'] as int,
            type: json['type'] as int,
        );
    }

    Map<String, dynamic> toJson() {
        final data = <String, dynamic>{};
        data['country'] = country;
        data['id'] = id;
        data['sunrise'] = sunrise;
        data['sunset'] = sunset;
        data['type'] = type;
        return data;
    }
}