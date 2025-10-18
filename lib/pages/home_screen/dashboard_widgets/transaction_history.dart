import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/mock_data.dart';
import '../../../utils/custom_widgets.dart';

class TransactionHistory extends StatelessWidget {
  final Function handleTransactionDetails;
  const TransactionHistory({super.key, required this.handleTransactionDetails});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.grey.withOpacity(0.1),
        child: ListView(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: appNormalText(
                title: 'Transaction History',
                fontSize: 20,
                textAlign: TextAlign.left,
                textColor: blackColor,
                textFontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            ...transactionList.map((transaction) {
              return GestureDetector(
                onTap: () => handleTransactionDetails(context, transaction),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 15,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appNormalText(
                              title: transaction['title'] as String,
                              fontSize: 18,
                              textFontWeight: FontWeight.w500,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            appNormalText(
                              title:
                                  'Transacted on ${transaction['transactionData']}',
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          appNormalText(
                            title:
                                '${transaction['isProfit'] ? '+' : '-'}${transaction['coins']}',
                            fontSize: 16,
                            textColor: transaction['isProfit']
                                ? appGreenColor2
                                : appRedColor2,
                            textFontWeight: FontWeight.w600,
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.arrow_forward_ios, size: 16),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
