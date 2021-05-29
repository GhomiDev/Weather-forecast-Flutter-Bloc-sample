import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_bloc/common/blocs/weather/weather.dart';
import 'package:weather_forecast_bloc/common/constants/static_values.dart';
import 'package:weather_forecast_bloc/common/widgets/app_bar_widget.dart';
import 'package:weather_forecast_bloc/common/widgets/grid_widget.dart';
import 'package:weather_forecast_bloc/common/widgets/main_menu_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  //Text widgets titles
  final String idleTextTitle = 'Listening to your thoughts...';
  final String listeningTextTitle = 'Nothing happening...';

  //to check if user is typing or not debounce timer is used
  late Timer _debounceTimer;

  //City name text field controller
  final _cityNameTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cityNameTextEditingController.addListener(_onCityNameChanged);
  }

  @override
  void dispose() {
    super.dispose();
    _cityNameTextEditingController.dispose();
  }

  late Size screenSize;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
            -0.7,
            1.7,
          ],
              colors: [
            Colors.yellow,
            Colors.red,
          ])),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: AppBarWidget(scaffoldKey: _scaffoldKey),
        extendBodyBehindAppBar: true,
        drawer: MainMenuWidget(scaffoldKey: _scaffoldKey),
        body: Container(
          width: screenSize.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'City name',
                textAlign: TextAlign.center,
              ),
              Container(
                width: screenSize.width * 70 / 100,
                child: TextField(
                  controller: _cityNameTextEditingController,
                ),
              ),
              SingleChildScrollView(
                child: BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (event, state){
                    return Column(
                      children: [
                        checkWeatherState(state),
                        StaticValues.weatherResponseModel==null? Container():
                        GridWidget(
                          weatherResponseModel: StaticValues.weatherResponseModel!,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onCityNameChanged() {
    if (_debounceTimer.isActive) _debounceTimer.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      BlocProvider.of<WeatherBloc>(context).add(GetWeatherDataEvent(cityName: _cityNameTextEditingController.text));
    });
  }

  Widget checkWeatherState(WeatherState state) {
    if(state is InitialWeatherState){
      return Text(idleTextTitle, textAlign: TextAlign.center);
    } else if(state is BusyState){
      return Text(idleTextTitle, textAlign: TextAlign.center);
    } else if(state is NotBusyState){
      return Text(idleTextTitle, textAlign: TextAlign.center);
    } else {
      return Text(idleTextTitle, textAlign: TextAlign.center);
    }
  }
}
