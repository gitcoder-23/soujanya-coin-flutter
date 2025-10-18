import 'package:flutter/material.dart';
import 'package:saujanya/constants/colors.dart';
import 'package:saujanya/routes/page_route.dart';

import '../../utils/custom_widgets.dart';

class LoginScreen extends StatefulWidget {
  static const String pageName = 'loginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();

  void onLogin() {
    // Close the keyboard
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
    } else {
      Navigator.of(context).pushReplacementNamed(PageRoutes.dashboardScreen);
    }
  }

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
              appNormalText(
                title: 'Soujanya',
                fontSize: 25,
                textAlign: TextAlign.center,
                textColor: appRedColor3,
                textFontWeight: FontWeight.w600,
              ),
              SizedBox(height: 30),
              textfield(
                context: context,
                hinttext: "Enter Phone Number",
                controller: phoneController,
              ),
              SizedBox(height: 20),

              appFullButton(
                buttonText: 'Login',
                ontap: () {
                  onLogin();
                },
                textFontSize: 16,
                btnColor: appBlueColor,
                btnTextColor: whiteColor,
                btnHeight: 50,
                btnTextFontWeight: FontWeight.w600,
                buttonIcon: Icons.arrow_forward_outlined,
                fontFamily: 'Jost',
                buttonIconSize: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
