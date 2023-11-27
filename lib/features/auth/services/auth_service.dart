// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_vars.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<void> signupUser({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      User user = User(
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '',
          id: '',
          iV: null);
      http.Response response = await http.post(
        Uri.parse('$uri/api/signup'),
        body: (user).toJson(), 
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      httpErrorHandling(
        response: response,
        context: context,
        onSuccess: () {
          shawSnackbar(
            context,
            'your account has been successfully created',
          );
        },
      );
      log(response.body);
    } catch (e) {
      shawSnackbar(
        context,
        e.toString(),
      );
    }
  }

  Future<void> signinUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      httpErrorHandling(
        response: response,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false)
              .setUser(response.body);
          await prefs.setString(
              'auth-token', jsonDecode(response.body)['token']);
          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.routeName, (route) => false);
        },
      );
      log(response.body);
    } catch (e) {
      shawSnackbar(
        context,
        e.toString(),
      );
    }
  }

  Future<void> getUserData(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("auth-token");
      if (token == null) prefs.setString("auth-token", "");
      // http.Response response = await http.post(
      //   Uri.parse('$uri/api/signin'),
      //   body: jsonEncode({'email': email, 'password': password}),
      //   headers: <String, String>{
      //     'Content-Type': 'application/json; charset=UTF-8'
      //   },
      // );
      // httpErrorHandling(
      //   response: response,
      //   context: context,
      //   onSuccess: () async {
      //     SharedPreferences prefs = await SharedPreferences.getInstance();
      //     Provider.of<UserProvider>(context, listen: false)
      //         .setUser(response.body);
      //     await prefs.setString(
      //         'auth-token', jsonDecode(response.body)['token']);
      //     Navigator.pushNamedAndRemoveUntil(
      //         context, HomeScreen.routeName, (route) => false);
      //   },
      // );
      // log(response.body);
    } catch (e) {
      shawSnackbar(
        context,
        e.toString(),
      );
    }
  }
}
