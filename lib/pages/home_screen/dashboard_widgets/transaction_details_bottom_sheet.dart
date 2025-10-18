import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../utils/custom_widgets.dart';

class TransactionDetailsBottomSheet extends StatelessWidget {
  final Map transaction;
  const TransactionDetailsBottomSheet({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              appNormalText(
                title: 'Transaction Details',
                fontSize: 20,
                textFontWeight: FontWeight.w600,
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop(context);
                },
                icon: Icon(Icons.close, color: blackColor),
              ),
            ],
          ),
          SizedBox(height: 15),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appNormalText(
                  title: 'Coins Redeemed',
                  fontSize: 18,
                  textFontWeight: FontWeight.w500,
                ),
                SizedBox(height: 8),
                appNormalText(
                  title: transaction['coinPrice'],
                  fontSize: 20,
                  textColor: blackColor,
                  textFontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appNormalText(
                  title: 'Transaction Id',
                  fontSize: 18,
                  textFontWeight: FontWeight.w500,
                ),
                SizedBox(height: 8),
                appNormalText(
                  title: transaction['transactionId'],
                  fontSize: 18,
                  textColor: blackColor,
                  textFontWeight: FontWeight.w600,
                ),
                SizedBox(height: 8),

                appNormalText(
                  title: 'Ordered On',
                  fontSize: 18,
                  textFontWeight: FontWeight.w500,
                ),
                SizedBox(height: 8),
                appNormalText(
                  title: transaction['transactionData'],
                  fontSize: 18,
                  textColor: blackColor,
                  textFontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),

          SizedBox(height: 10),
          Center(
            child: appNormalText(
              title: 'FAQS',
              fontSize: 18,
              textColor: pinkColor2,
              textFontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
