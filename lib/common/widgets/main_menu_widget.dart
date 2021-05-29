import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_forecast_bloc/common/blocs/weather/weather.dart';
import 'package:weather_forecast_bloc/common/constants/static_values.dart';

class MainMenuWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MainMenuWidget({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  _MainMenuWidgetState createState() => _MainMenuWidgetState();
}

class _MainMenuWidgetState extends State<MainMenuWidget> {
  final Completer<GoogleMapController> _controller = Completer();

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  late MarkerId selectedMarker;
  late Marker marker;
  var mapType;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final markerIdVal = '';
    final markerId = MarkerId(markerIdVal);

    markers.clear();
    marker = Marker(
      markerId: markerId,
      position: LatLng(0.0, 0.0),
      infoWindow: InfoWindow(title: markerIdVal, snippet: ''),
      onTap: () {},
    );
    markers[markerId] = marker;
    mapType = MapType.normal;
  }

  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: pageWidth,
      child: Drawer(
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            if (StaticValues.weatherResponseModel!=null) {
              var markerIdVal = '';
              var markerId = MarkerId(markerIdVal);
              markers.clear();
              marker = Marker(
                markerId: markerId,
                position: LatLng(StaticValues.weatherResponseModel!.coord!.lat, StaticValues.weatherResponseModel!.coord!.lon),
                infoWindow: InfoWindow(title: markerIdVal, snippet: ''),
                onTap: () {
                  //Do somthing on clicking on the
                },
              );
              markers[markerId] = marker;

              var _kGooglePlex = CameraPosition(
                target: LatLng(StaticValues.weatherResponseModel!.coord!.lat, StaticValues.weatherResponseModel!.coord!.lon),
                zoom: 7,
              );
              return Scaffold(
                body: GoogleMap(
                    myLocationEnabled: true,
                    mapType: MapType.normal,
                    markers: Set<Marker>.of(markers.values),
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    }),
                floatingActionButton: FloatingActionButton(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepOrangeAccent,
                  onPressed: () {
                    widget.scaffoldKey.currentState!.openEndDrawer();
                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
              );
            }
            return Scaffold(
              body: Center(child: Text('Search and find a city to show it on the map')),
              floatingActionButton: FloatingActionButton(
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepOrangeAccent,
                onPressed: () {
                  widget.scaffoldKey.currentState!.openEndDrawer();
                },
                child: Icon(Icons.arrow_forward_ios),
              ),
              floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
            );
          },
        ),
      ),
    );
  }
}
