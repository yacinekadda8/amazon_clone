import 'package:flutter/material.dart';

void shawSnackbar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}
