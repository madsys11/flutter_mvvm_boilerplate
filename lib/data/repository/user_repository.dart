import 'package:flutter_mvvm_boilerplate/app/locator.dart';
import 'package:flutter_mvvm_boilerplate/data/model/user.dart';
import 'package:flutter_mvvm_boilerplate/data/service/response_error.dart';
import 'package:flutter_mvvm_boilerplate/data/service/rest_api.dart';
import 'package:flutter_mvvm_boilerplate/data/service/service_name.dart';
import 'package:flutter_mvvm_boilerplate/data/service/service_response.dart';

abstract class UserRepository {
  Future<dynamic> fetchUser(String id, String token);
}

class UserRepositoryImplementation extends UserRepository {
  final RestApi _restApi = locator<RestApi>();

  @override
  Future<dynamic> fetchUser(String id, String token) async {
    String params = 'id=$id&token=$token';
    dynamic response = await _restApi.request(ServiceName.fetchUser, params);
    print('UserRepository.fetchUser.response: $response');
    if (ServiceResponse.success(response)) {
      final userData = response['userData'];
      if (userData != null) {
        return User.fromJson(userData);
      }
    }

    return ResponseError.fromMap(response);
  }
}
