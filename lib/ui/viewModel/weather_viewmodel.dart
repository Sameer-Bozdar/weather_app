import 'package:flutter/material.dart';
import '../../core/data/response/api_response.dart';
import '../../core/model/weather_model.dart';
import '../../core/repository/weather_repository.dart';
import '../../core/utils/utils.dart';

class WeatherViewModel extends ChangeNotifier {
  final _myRepo = WeatherRepository();

  ApiResponse<WeatherModel> apiResponse = ApiResponse.loading();

  setDataResponse(ApiResponse<WeatherModel> response) async {
    apiResponse = response;
    notifyListeners();
  }

  Future<void> postTodoApi(dynamic dataa) async {
    print('$dataa in View Model');
    _myRepo.postWeatherQuery(dataa).then((value) {
      setDataResponse(ApiResponse.completed(value));
      Utils.toastMessage('Creation success');
    }).onError((error, stackTrace) {
      setDataResponse(ApiResponse.error(error.toString()));
      Utils.toastMessage(error.toString());
    });
  }
}
