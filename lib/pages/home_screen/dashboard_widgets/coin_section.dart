import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/colors.dart';
import '../../../utils/custom_widgets.dart';

class CoinSection extends StatelessWidget {
  const CoinSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: pinkColor1,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              SvgPicture.asset(
                'assets/icons/coins.svg',
                height: 55,
                width: 55,
                color: appGreenColor2,
              ),
              SizedBox(height: 5),
              appNormalText(
                title: 'Available',
                fontSize: 16,
                textColor: greyTextColor2,
                textFontWeight: FontWeight.w500,
              ),
              appNormalText(
                title: '5,856',
                fontSize: 20,
                textColor: blackColor,
                textFontWeight: FontWeight.w600,
              ),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset(
                'assets/icons/unlock.svg',
                height: 55,
                width: 55,
                color: appBlueColor2,
              ),
              SizedBox(height: 5),
              appNormalText(
                title: 'Unlocked',
                fontSize: 16,
                textColor: greyTextColor2,
                textFontWeight: FontWeight.w500,
              ),
              appNormalText(
                title: '5',
                fontSize: 20,
                textColor: blackColor,
                textFontWeight: FontWeight.w600,
              ),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset(
                'assets/icons/watch.svg',
                height: 55,
                width: 55,
                color: appRedColor1,
              ),
              SizedBox(height: 5),
              appNormalText(
                title: 'Expiring',
                fontSize: 16,
                textColor: greyTextColor2,
                textFontWeight: FontWeight.w500,
              ),
              appNormalText(
                title: '25',
                fontSize: 20,
                textColor: blackColor,
                textFontWeight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
