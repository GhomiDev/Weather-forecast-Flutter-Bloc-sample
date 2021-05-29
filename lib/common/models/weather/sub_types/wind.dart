class Wind {
  int deg;
  var speed;

  Wind({required this.deg, this.speed});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      deg: json['deg'] as int,
      speed: json['speed'],
    );
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['deg'] = deg;
    data['speed'] = speed;
    return data;
  }
}
