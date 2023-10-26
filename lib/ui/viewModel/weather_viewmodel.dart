import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../core/data/response/api_response.dart';
import '../../core/model/weather_model.dart';
import '../../core/repository/weather_repository.dart';
import '../../core/utils/utils.dart';


class WeatherViewModel extends ChangeNotifier {






  Position? position;
  WeatherViewModel(){
    init();
  }
  init()async{


    String address = await getAddressFromLatLng();
    print('====${address}');
    await postTodoApi(address);


  }

  final _myRepo = WeatherRepository();

  ApiResponse<WeatherModel> apiResponse = ApiResponse.loading();

  setDataResponse(ApiResponse<WeatherModel> response) async {
    apiResponse = response;
    notifyListeners();
  }


  Future<String> getAddressFromLatLng() async {
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks = await placemarkFromCoordinates(position!.latitude, position!.longitude);
    print('${position!.latitude}, ${position!.longitude}');

    var add='${placemarks[0].locality}';

    return add;
  }






  Future<void> postTodoApi(dynamic data) async {
    print('$data in View Model');
    _myRepo.postWeatherQuery(data).then((value) {
      setDataResponse(ApiResponse.completed(value));
      Utils.toastMessage('Creation success');
      notifyListeners();
    }).onError((error, stackTrace) {
      setDataResponse(ApiResponse.error(error.toString()));
      Utils.toastMessage(error.toString());
    });
  }
}
