
class Sys {
    String country;
    int id;
    int sunrise;
    int sunset;
    int type;

    Sys({this.country, this.id, this.sunrise, this.sunset, this.type});

    factory Sys.fromJson(Map<String, dynamic> json) {
        return Sys(
            country: json['country'], 
            id: json['id'], 
            sunrise: json['sunrise'], 
            sunset: json['sunset'], 
            type: json['type'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['country'] = this.country;
        data['id'] = this.id;
        data['sunrise'] = this.sunrise;
        data['sunset'] = this.sunset;
        data['type'] = this.type;
        return data;
    }
}