import 'package:flutter/material.dart';
import 'package:saujanya/constants/colors.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final double? hintTextSize;
  final double? textSize;
  final TextEditingController? controller;
  final int? maxLines;
  final bool? isPrefixIcon;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final double? prefixIconSize;
  final VoidCallback? onPrefixIconPressed;
  final bool? isSuffixIcon;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final double? suffixIconSize;
  final VoidCallback? onSuffixIconPressed;
  final bool? isReadOnly;
  final bool? isEnabled;
  final bool? isObscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isDense;
  final bool? isFilled;

  const CustomInputField({
    super.key,
    required this.hintText,
    this.hintTextSize,
    this.controller,
    this.textSize,
    this.maxLines,
    this.isPrefixIcon = false,
    this.prefixIcon,
    this.prefixIconColor,
    this.prefixIconSize = 20,
    this.onPrefixIconPressed,
    this.isSuffixIcon = false,
    this.suffixIcon,
    this.suffixIconColor,
    this.suffixIconSize = 20,
    this.onSuffixIconPressed,
    this.isReadOnly = false,
    this.isEnabled = true,
    this.isObscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.textStyle,
    this.hintTextStyle,
    this.contentPadding,
    this.isDense = true, // Set this to true for a more compact field
    this.isFilled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        maxLines: maxLines ?? 1,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: isPrefixIcon == true
              ? IconButton(
                  onPressed: onPrefixIconPressed as VoidCallback?,
                  icon: Icon(
                    prefixIcon,
                    color: prefixIconColor,
                    size: prefixIconSize,
                  ),
                )
              : null,
          suffixIcon: isSuffixIcon == true
              ? IconButton(
                  onPressed: onSuffixIconPressed as VoidCallback?,
                  icon: Icon(
                    suffixIcon,
                    color: suffixIconColor,
                    size: suffixIconSize,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          hintText: hintText,
          hintStyle: TextStyle(
            color: greyColor2,
            fontSize: hintTextSize ?? 12,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
          ),
          border: InputBorder.none,
        ),
        style: TextStyle(
          fontSize: textSize ?? 12,
          fontWeight: FontWeight.w400,
          color: blackColor,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
