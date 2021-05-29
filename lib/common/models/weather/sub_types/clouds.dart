
class Clouds {
    int all;

    Clouds({required this.all});

    factory Clouds.fromJson(Map<String, dynamic> json) {
        return Clouds(
            all: json['all'] as int,
        );
    }

    Map<String, dynamic> toJson() {
        final data = <String, dynamic>{};
        data['all'] = all;
        return data;
    }
}