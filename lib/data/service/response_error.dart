import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm_boilerplate/data/service/response_code.dart';

class ResponseError {
  final String code;
  final String message;

  ResponseError({required this.code, required this.message});

  // Change to your protocol.
  factory ResponseError.fromMap(Map<String, dynamic> json) {
    if (json.containsKey('code') && json.containsKey('message')) {
      return ResponseError(
          code: json['code'] as String, message: json['message'] as String);
    }

    return unknownError();
  }

  static unknownError() {
    return ResponseError(
        code: ResponseCode.UnknownError,
        message: 'An unknown error has occurred.');
  }

  bool isExpiredKey() {
    return code == ResponseCode.ExpiredKey;
  }

  debug() {
    if (kDebugMode) {
      print('ResponseError.code: $code, message: $message');
    }
  }
}
