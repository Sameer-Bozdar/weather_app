


import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../model/weather_model.dart';
import '../app_exceptions.dart';
import 'baseApiServices.dart';
class NetworkApiServices extends BaseApiServices {



  // fetching  the data
  @override
  Future getGetApiResponse(String url) async {
    var responseJson;
    try {
      dynamic response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  // Posting the data
  @override
  Future getPostApiResponseWithHeader(String url, dynamic data) async {
    dynamic responseJson;
    Map<String , dynamic > queryParameter = {
      'q' : data,
      'key' : '8356ad094c77411bbea120841231010',
    };
var uri = Uri.parse(url).replace(queryParameters: queryParameter);
print(uri);
    try {
      Response response = await post(uri, headers: <String, String>{"Content-Type": "application/json"}
      ).timeout(Duration(seconds: 20));
      responseJson = returnResponse(response);

      print('response of data in Network Class ${responseJson.toString()}');
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return WeatherModel.fromJson(responseJson);
  }



  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {

      case 200:
        print(response.statusCode);
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonEncode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorizedtException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while communicating with server' +
                'with status code' +
                response.statusCode.toString());
    }
  }




}




