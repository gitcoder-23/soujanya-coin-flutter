import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saujanya/constants/colors.dart';
import 'package:saujanya/controllers/auth_controller.dart';
import 'package:saujanya/utils/custom_widgets.dart';

import 'dashboard_widgets/coin_section.dart';
import 'dashboard_widgets/transaction_details_bottom_sheet.dart';
import 'dashboard_widgets/transaction_history.dart';

class DashboardScreen extends StatefulWidget {
  static const String pageName = 'dashboardScreen';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  AuthController authController = Get.put(AuthController());

  void handleTransactionDetails(BuildContext context, Map transaction) {
    showModalBottomSheet(
      isDismissible: true,
      useSafeArea: true,
      backgroundColor: whiteColor,
      context: context,
      builder: (BuildContext context) {
        return TransactionDetailsBottomSheet(transaction: transaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 10),
        backgroundColor: appBlueColor.withOpacity(0.4),
        centerTitle: true,
        elevation: 1,
        title: appNormalText(
          title: 'Soujanya Coin',
          fontSize: 20,
          textAlign: TextAlign.center,
          textColor: blackColor,
          textFontWeight: FontWeight.w600,
        ),
        actions: [
          IconButton(
            onPressed: () {
              authController.quickLogOut(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const CoinSection(),
            TransactionHistory(
              handleTransactionDetails: handleTransactionDetails,
            ),
          ],
        ),
      ),
    );
  }
}
