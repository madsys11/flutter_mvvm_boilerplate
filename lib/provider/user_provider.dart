import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/app/locator.dart';
import 'package:flutter_mvvm_boilerplate/data/model/user.dart';
import 'package:flutter_mvvm_boilerplate/data/repository/user_repository.dart';
import 'package:flutter_mvvm_boilerplate/data/service/response_error.dart';

class UserProvider with ChangeNotifier {
  final UserRepository _userRepository = locator<UserRepository>();

  User? _user;

  User? get user {
    return _user;
  }

  Future<String?> fetchUser(String id, String token) async {
    // Test Code
    if (kDebugMode) {
      _user = User(id: 'id123', name: 'name123');
      return null;
    }

    String resultMessage = 'Fail to get user data.';
    try {
      dynamic result = await _userRepository.fetchUser(id, token);
      if (result is User) {
        _user = result;
        notifyListeners();
        return null;
      } else if (result is ResponseError) {
        resultMessage = result.message;
      }
    } catch (e) {
      print('fetchUser.error: $e');
    }

    return resultMessage;
  }
}
