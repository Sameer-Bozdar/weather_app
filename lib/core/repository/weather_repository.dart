import '../data/network/baseApiServices.dart';
import '../data/network/networkApiServices.dart';
import '../model/weather_model.dart';
import '../res/app_url.dart';
import '../utils/utils.dart';

class WeatherRepository {
  BaseApiServices _apiServicesObject = NetworkApiServices();


  Future<dynamic> postWeatherQuery(dynamic data) async {
    print('$data + in Respository');
    var response = await _apiServicesObject.getPostApiResponseWithHeader(AppUrl.forecastUrl, data);
    print('====${response.toString()}');
    return  response;
  }
}
