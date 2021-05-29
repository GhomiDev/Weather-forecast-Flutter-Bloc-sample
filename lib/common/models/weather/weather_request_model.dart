class WeatherRequestModel {
  final String cityName;

  WeatherRequestModel({
    required this.cityName,
  });

  factory WeatherRequestModel.fromJson(Map<String, dynamic> json) {
    return WeatherRequestModel(
      cityName: json['cityName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['cityName'] = cityName;
    return data;
  }
}
