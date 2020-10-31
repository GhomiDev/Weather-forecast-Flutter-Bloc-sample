import 'package:bloc/bloc.dart';

import 'package:weather_forecast_bloc/common/blocs/drawer/drawer.dart';

class DrawerBloc extends Bloc<DrawerEvent,DrawerState>{
  DrawerBloc(DrawerState initialState) : super(initialState);

  @override
  Stream<DrawerState> mapEventToState(DrawerEvent event) async*{
    if(event is NewLocationOnMapEvent){
      yield NewLocationOnMapState(latitude: event.latitude, longitude: event.longitude);
    }
  }
}

//   @action
//   void setMapCoordinates(double latitude, double longitude){
//     drawerStoreState = new NewLocationOnMapState(
//         latitude: latitude, longitude: longitude);
//   }
// }
