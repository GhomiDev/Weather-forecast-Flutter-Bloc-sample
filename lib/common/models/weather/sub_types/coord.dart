
class Coord {
    double lat;
    double lon;

    Coord({required this.lat, required this.lon});

    factory Coord.fromJson(Map<String, dynamic> json) {
        return Coord(
            lat: json['lat'] as double,
            lon: json['lon'] as double,
        );
    }

    Map<String, dynamic> toJson() {
        final data = <String, dynamic>{};
        data['lat'] = lat;
        data['lon'] = lon;
        return data;
    }
}