import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saujanya/constants/colors.dart';
import 'package:saujanya/routes/page_route.dart';
import 'package:saujanya/utils/custom_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/config.dart' as config;

class AuthController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isLogin = false.obs;
  RxString loginMessage = ''.obs;
  RxBool isLoginLoading = false.obs;

  final RxString _userToken = ''.obs;

  String? get userToken => _userToken.value;

  Map<String, String> httpHeaders = {
    HttpHeaders.contentTypeHeader: "application/json",
  };

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: config.baseUrl,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    ),
  );

  set userToken(String? value) {
    _userToken.value = value ?? '';
    storeUserToken(_userToken.value);
  }

  bool get isAuthenticated {
    return userToken != null && userToken!.isNotEmpty;
  }

  // OnLogin
  void onLogin(context) async {
    FocusScope.of(context).unfocus();

    String phoneNumber = phoneController.text;

    RegExp phoneRegExp = RegExp(r'^[0-9]{10}$');

    if (phoneNumber.isEmpty) {
      showToast(context, "Please enter phone number", blackColor3);
    } else if (!phoneRegExp.hasMatch(phoneNumber)) {
      showToast(
        context,
        "Please enter a valid 10-digit phone number",
        blackColor3,
      );
    } else if (passwordController.text.isEmpty) {
      showToast(context, "Please enter password", blackColor3);
    } else if (passwordController.text.length < 8) {
      showToast(context, "Password atleast 8 character long", blackColor3);
    } else {
      final loginRequest = {
        "email": phoneController.text,
        "password": passwordController.text,
      };
      String message = await authLogin(loginRequest, context);
      if (message.isNotEmpty) {
        showToast(context, message, blackColor3);
      } else {
        showToast(context, 'Login Failed! Please Login Again.', appRedColor4);
      }
    }
  }

  // API work

  // Store token to SharedPreferences
  Future<void> storeUserToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userToken', token);
  }

  // Get user token from SharedPreferences
  Future<void> loadUserTokenFromStore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userToken.value = prefs.getString('userToken') ?? '';
  }

  Future<String> authLogin(loginRequest, BuildContext context) async {
    String message = '';
    try {
      isLoginLoading.value = true;

      final response = await _dio.post(config.loginApi(), data: loginRequest);
      log('authLogin API call response:--$response');

      if (response.statusCode == 200) {
        isLogin.value = true;
        message = "Login successful";
        loginMessage.value = response.data['message'] ?? "Login successful";
        userToken = response.data['data']['token'];
        if (isAuthenticated) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            PageRoutes.dashboardScreen,
            (Route<dynamic> route) => false,
          );
        } else {
          Navigator.of(context).pushNamedAndRemoveUntil(
            PageRoutes.loginScreen,
            (Route<dynamic> route) => false,
          );
        }
      } else {
        message = "Login failed: ${response.statusMessage}";
        loginMessage.value = "Login failed: ${response.statusMessage}";
      }
    } on DioException catch (e) {
      final errorMessage =
          e.response?.data?['data']?['message'] ??
          e.response?.data?['message'] ??
          e.message ??
          'An unknown error occurred';
      message = "Error: $errorMessage";
      loginMessage.value = "Error: $errorMessage";
    } catch (e) {
      message = "Unexpected error: $e";
      loginMessage.value = "Unexpected error: $e";
    } finally {
      isLoginLoading.value = false;
      loginMessage.value = message;
      return message;
    }
  }

  Future<void> quickLogOut(BuildContext context) async {
    log('Logout API call successful:--Quick');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userToken');
    await prefs.clear();
    userToken = '';

    Navigator.of(context).pushNamedAndRemoveUntil(
      PageRoutes.loginScreen,
      (Route<dynamic> route) => false,
    );
  }
}
