import 'dart:io';

import 'package:flutter_mvvm_boilerplate/data/service/exception.dart';
import 'package:flutter_mvvm_boilerplate/data/service/service_response.dart';
import 'package:http/http.dart' as http;

import 'service_config.dart';

abstract class RestApi {
  Future<dynamic> request(String service, String params);
}

class RestApiImplementation extends RestApi {
  @override
  Future<dynamic> request(String serviceName, String params) async {
    final String endPoint = '${ServiceConfig.REST_SERVICE}/$serviceName';
    String url = (params.isNotEmpty) ? '$endPoint?$params' : endPoint;
    try {
      return http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: ServiceConfig.TIME_OUT), onTimeout: () {
        ServiceResponse.timeout();
        throw TimeoutException('${ServiceConfig.TIME_OUT} seconds');
      }).then((response) {
        return ServiceResponse.toJson(response);
      });
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }
}
