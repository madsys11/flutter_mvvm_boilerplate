import 'dart:convert';

import 'package:flutter_mvvm_boilerplate/app/locator.dart';
import 'package:flutter_mvvm_boilerplate/app/navigation_service.dart';
import 'package:flutter_mvvm_boilerplate/data/service/exception.dart';
import 'package:flutter_mvvm_boilerplate/data/service/response_code.dart';
import 'package:flutter_mvvm_boilerplate/data/service/response_error.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

// Change to your protocol.
class ServiceResponse {
  static timeout() {
    print('timeout');
    Fluttertoast.showToast(msg: 'Unable to connect to the server.');
  }

  static handleError(ResponseError responseError,
      {String? loginScreenRouteName}) {
    if (responseError.code == ResponseCode.ExpiredKey) {
      if (loginScreenRouteName != null) {
        locator<NavigationService>()
            .pushNamedAndRemoveAll(loginScreenRouteName);
      }
      Fluttertoast.showToast(msg: 'Your session has expired.');
    } else {
      Fluttertoast.showToast(msg: responseError.message);
    }
  }

  static bool success(dynamic response) {
    return response['success'] ?? false;
  }

  static dynamic data(dynamic response) {
    return response['data'] ?? null;
  }

  static dynamic toJson(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
