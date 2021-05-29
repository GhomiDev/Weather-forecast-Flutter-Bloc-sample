class Weather {
  String description;
  String icon;
  int id;
  String main;

  Weather({required this.description, required this.icon, required this.id, required this.main});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      description: json['description'] as String,
      icon: json['icon'] as String,
      id: json['id'] as int,
      main: json['main'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['description'] = description;
    data['icon'] = icon;
    data['id'] = id;
    data['main'] = main;
    return data;
  }
}
