import 'dart:convert';

import 'package:amazon_clone/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandling({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      shawSnackbar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      shawSnackbar(context, jsonDecode(response.body)['error']);
      break;
    default:
      shawSnackbar(context, response.body);
  }
}
