import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:weather_forecast_bloc/common/models/weather/weather_response_model.dart';
import 'package:weather_forecast_bloc/common/widgets/weather_tile.dart';

class GridWidget extends StatelessWidget {
  final WeatherResponseModel weatherResponseModel;

  GridWidget({required this.weatherResponseModel});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var _staggeredTiles = const <StaggeredTile>[
      StaggeredTile.count(2, 2),
      StaggeredTile.count(2, 1.3),
      StaggeredTile.count(2, 1.3),
      StaggeredTile.count(2, 2),
      StaggeredTile.count(2, 2),
      StaggeredTile.count(2, 2),
      StaggeredTile.count(2, 1.4),
    ];

    var _tiles = <Widget>[
      WeatherTile(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        iconData: Icons.whatshot,
        title: 'Temperature',
        description:
        '${weatherResponseModel.main!.temp}°C in ${weatherResponseModel.name}',
      ),
      WeatherTile(
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightBlue,
        iconData: Icons.where_to_vote,
        title: 'Country',
        description: '${weatherResponseModel.sys!.country}',
      ),
      WeatherTile(
        foregroundColor: Colors.white,
        backgroundColor: Colors.amber,
        iconData: Icons.panorama_wide_angle,
        title: 'Humidity',
        description: '${weatherResponseModel.main!.humidity}%',
      ),
      WeatherTile(
        foregroundColor: Colors.white,
        backgroundColor: Colors.brown,
        iconData: Icons.speed,
        title: 'Wind',
        description:
        'Speed ${weatherResponseModel.wind!.speed} meter/sec \n degree: ${weatherResponseModel.wind!.deg} degree',
      ),
      WeatherTile(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepOrange,
        iconData: Icons.branding_watermark_outlined,
        title: 'Temperature range',
        description:
        '${weatherResponseModel.main!.temp_min}°C\n${weatherResponseModel.main!.temp_max}°C',
      ),
      WeatherTile(
        foregroundColor: Colors.white,
        backgroundColor: Colors.pink,
        iconData: Icons.cloud,
        title: 'Cloudiness',
        description: '${weatherResponseModel.clouds!.all}%',
      ),
      WeatherTile(
        foregroundColor: Colors.white,
        backgroundColor: Colors.indigo,
        iconData: Icons.present_to_all_sharp,
        title: 'Pressure',
        description: '${weatherResponseModel.main!.pressure} hPa',
      ),
    ];

    return Container(
      width: screenSize.width * 80 / 100,
      height: screenSize.height * 50 / 100,
      child: Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: StaggeredGridView.count(
            crossAxisCount: 4,
            staggeredTiles: _staggeredTiles,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            padding: const EdgeInsets.all(4.0),
            children: _tiles,
          )),
    );
  }
}
