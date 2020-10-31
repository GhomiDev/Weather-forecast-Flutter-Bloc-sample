
class WeatherRequestModel {
  final String cityName;

  WeatherRequestModel({
    this.cityName,
  });

  factory WeatherRequestModel.fromJson(Map<String, dynamic> json) {
    return WeatherRequestModel(
      cityName: json['cityName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cityName'] = this.cityName;
    return data;
  }
}