import 'package:flutter/material.dart';

import '../../app/const.dart';

ButtonStyle primaryButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
  // backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
  //   if (states.contains(MaterialState.disabled)) {
  //     return Colors.grey; // Disabled color
  //   }
  //   return kPrimaryColor; // Regular color
  // }),
);

ButtonStyle elevateButtonStyle = ElevatedButton.styleFrom(
  onSurface: kPrimaryColor,
);

const TextStyle boldTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

const TextStyle primaryTextStyle = TextStyle(
  fontSize: 18,
);

const TextStyle subTextStyle = TextStyle(
  fontSize: 16,
);
