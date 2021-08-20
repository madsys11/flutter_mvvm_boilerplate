import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/app/const.dart';

class Feedbacks {
  static showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          Icon(Icons.check, color: Colors.white),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(message.replaceAll('. ', '.\n')),
          ),
        ],
      ),
      backgroundColor: kPrimaryColor,
    ));
  }

  static showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.white),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(message.replaceAll('. ', '.\n')),
          ),
        ],
      ),
      backgroundColor: kErrorColor,
    ));
  }
}
