import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saujanya/constants/colors.dart';

import '../../controllers/auth_controller.dart';
import '../../utils/custom_widgets.dart';

class LoginScreen extends StatefulWidget {
  static const String pageName = 'loginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: whiteColor),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/soujanya_logo.jpeg', height: 250),
              textfield(
                context: context,
                hinttext: "Enter Phone Number*",
                controller: authController.phoneController,
                isNumberOnly: true,
              ),
              SizedBox(height: 20),
              textfield(
                context: context,
                textFieldBackgroundColor: whiteColor,
                controller: authController.passwordController,
                hinttext: 'Enter Password*',
                obscureText: true,
              ),
              SizedBox(height: 20),

              Obx(() {
                final bool isLoading = authController.isLoginLoading.value;
                return appFullButton(
                  buttonText: isLoading ? 'Logging in...' : 'Login',
                  ontap: isLoading
                      ? null
                      : () {
                          authController.onLogin(context);
                        },
                  textFontSize: 16,
                  btnColor: isLoading ? Colors.grey : appBlueColor,
                  btnTextColor: whiteColor,
                  btnHeight: 50,
                  btnTextFontWeight: FontWeight.w600,
                  buttonIcon: isLoading ? null : Icons.arrow_forward_outlined,
                  fontFamily: 'Jost',
                  buttonIconSize: 20,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
