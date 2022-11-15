import 'package:flutter/material.dart';

String uri = 'https://60e29b749103bd0017b4743f.mockapi.io';

class AppApis {
  static String getTransactions = '$uri/api/v1/transactions';
}

class AppColors {
  static const Color backgroundColor = Color.fromRGBO(189, 173, 164, 1);
  static const Color primaryColor = Color.fromRGBO(78, 75, 112, 1);
  static const Color secondaryColor = Color.fromRGBO(148, 145, 189, 1);
}
