import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/app/locator.dart';
import 'package:flutter_mvvm_boilerplate/data/service/response_error.dart';
import 'package:flutter_mvvm_boilerplate/data/service/rest_api.dart';
import 'package:flutter_mvvm_boilerplate/data/service/service_name.dart';
import 'package:flutter_mvvm_boilerplate/data/service/service_response.dart';

class LoginProvider with ChangeNotifier {
  final RestApi _restApi = locator<RestApi>();

  bool _rememberMe = true;
  bool _autoLogin = true;
  String? _token;

  bool get rememberMe {
    return _rememberMe;
  }

  bool get autoLogin {
    return _autoLogin;
  }

  String? get token {
    return _token;
  }

  Future<ResponseError?> login(String id, String pw) async {
    // Test Code
    if (kDebugMode) {
      _token = 'qwerty';
      return null;
    }

    String params = 'id=$id&pw=$pw';
    try {
      dynamic response = await _restApi.request(ServiceName.login, params);
      print('LoginProvider.login.response: $response');
      if (ServiceResponse.success(response)) {
        _token = response['token'];
        return null;
      }
    } catch (e) {
      return ResponseError.unknownError();
    }
  }

  Future<bool> logout(String id) async {
    return false;
  }

  changeRememberMe() {
    _rememberMe = !_rememberMe;
    notifyListeners();
  }

  changeAutoLogin() {
    _autoLogin = !_autoLogin;
    notifyListeners();
  }
}
