import 'package:flutter/material.dart';

final validAlphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
final validLowerAlphanumeric = RegExp(r'^[a-z0-9]+$');

final FormFieldValidator<String> idValidator = (value) {
  if (value == null || value.length == 0) {
    return 'Please enter your account.';
  }
  if (validLowerAlphanumeric.hasMatch(value) == false) {
    return 'Only lower case letters and numbers are allowed.';
  }
  return null;
};

final FormFieldValidator<String> passwordValidator = (value) {
  if (value == null || value.length == 0) {
    return 'Please enter your password.';
  }
  return null;
};
