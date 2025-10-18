import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/colors.dart';

void showToast(BuildContext ctx, String msg, Color? bgColor) {
  ScaffoldMessenger.of(ctx).showSnackBar(
    SnackBar(
      content: Text(msg),
      duration: const Duration(milliseconds: 1500),
      backgroundColor: bgColor ?? appBlueColor,
    ),
  );
}

appText({
  required String title,
  required double fontSize,
  String? fontFamily,
  Color? textColor,
  FontWeight? textFontWeight,
  TextAlign? textAlign,
  Alignment? alignment,
  TextDecoration? textDecoration,
}) {
  return Container(
    alignment: alignment ?? Alignment.centerLeft,
    child: Text(
      softWrap: true,
      textAlign: textAlign ?? TextAlign.left,
      title.toString(),
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily ?? 'Jost',
        color: textColor ?? blackColor,
        fontWeight: textFontWeight ?? FontWeight.normal,
        decoration: textDecoration ?? TextDecoration.none,
      ),
    ),
  );
}

appNormalText({
  required String title,
  required double fontSize,
  String? fontFamily,
  Color? textColor,
  FontWeight? textFontWeight,
  TextAlign? textAlign,
  TextDecoration? textDecoration,
  int? maxLines,
  TextOverflow? overflow,
}) {
  return Text(
    softWrap: true,
    textAlign: textAlign ?? TextAlign.left,
    title.toString(),
    maxLines: maxLines,
    overflow: overflow,
    style: TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily ?? 'Jost',
      color: textColor ?? blackColor,
      fontWeight: textFontWeight ?? FontWeight.normal,
      decoration: textDecoration ?? TextDecoration.none,
    ),
  );
}

Widget textfield({
  required BuildContext context,
  String? hinttext,
  TextInputType? keyboardType,
  List<TextInputFormatter>? inputFormatters,
  Function()? ontap,
  double? Width,
  double? height,
  bool? obscureText,
  TextEditingController? controller,
  String? fontFamily,
  String? textFieldIcon,
  IconButton? textFieldSuffixIcon,
  double? hintTextFontSize,
  FontWeight? hintTextFontWeight,
  String? hintTextFontFamily,
  Color? textFieldBackgroundColor,
  double? textFieldBorder,
  double? paddingLeft,
  double? paddingRight,
  double? paddingTop,
  double? paddingBottom,
  double? borderRadiusValue,
  Color? borderColor,
  double? borderRadiusTopLeft,
  double? borderRadiusTopRight,
  double? borderRadiusBottomLeft,
  double? borderRadiusBottomRight,
  int? textFieldMaxLines,
  bool? readOnly,
  bool? isNumberOnly,
  int? maxTextLength,
  TextInputAction? textInputAction,
}) {
  bool isObscure = obscureText ?? false;

  return Container(
    padding: EdgeInsets.only(
      top: paddingTop ?? 4,
      left: paddingLeft ?? 16,
      bottom: paddingBottom ?? 4,
      right: paddingRight ?? 0,
    ),
    width: Width,
    height: (textFieldMaxLines == null || isObscure) ? height ?? 58 : null,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(borderRadiusTopLeft ?? 8),
        topRight: Radius.circular(borderRadiusTopRight ?? 8),
        bottomLeft: Radius.circular(borderRadiusBottomLeft ?? 8),
        bottomRight: Radius.circular(borderRadiusBottomRight ?? 8),
      ),
      color: readOnly == true
          ? Colors.black.withOpacity(0.28)
          : textFieldBackgroundColor ?? Colors.white.withOpacity(0.2),
      border: Border.all(
        width: textFieldBorder ?? 1.4,
        color: borderColor ?? Colors.grey.shade300,
      ),
    ),
    child: TextFormField(
      readOnly: readOnly ?? false,
      maxLines: isObscure ? 1 : textFieldMaxLines,
      obscureText: isObscure,
      keyboardType: isNumberOnly == true ? TextInputType.number : keyboardType,

      inputFormatters: [
        if (isNumberOnly == true) FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(maxTextLength),
        ...?inputFormatters,
      ],
      style: TextStyle(
        fontSize: 16,
        color: Colors.black87,
        fontFamily: fontFamily ?? 'Jost',
      ),
      onTap: ontap,
      controller: controller,
      textInputAction:
          textInputAction ?? TextInputAction.done, // Added textInputAction
      onFieldSubmitted: (_) {
        FocusScope.of(
          context,
        ).unfocus(); // Added this to dismiss the keyboard on "Done"
      },
      decoration: InputDecoration(
        prefixIcon: textFieldIcon != null
            ? Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: Image.asset(
                  textFieldIcon,
                  width: 24,
                  height: 24,
                  color: Colors.black,
                ),
              )
            : null,
        suffixIcon: textFieldSuffixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: textFieldSuffixIcon,
              )
            : null,
        hintText: hinttext,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontWeight: hintTextFontWeight ?? FontWeight.normal,
          fontSize: hintTextFontSize,
          fontFamily: hintTextFontFamily ?? 'Jost',
        ),
        labelStyle: TextStyle(
          color: Colors.black87,
          fontFamily: fontFamily ?? 'Jost',
          fontSize: 16,
        ),
        border: InputBorder.none,
      ),
    ),
  );
}

appFullButton({
  Function()? ontap,
  String? buttonText,
  String? fontFamily,
  String? btnType,
  Color? btnColor,
  Color? btnTextColor,
  double? btnHeight,
  double? btnWidth,
  Color? btnBorderColor,
  double? btnBorderWidth,
  FontWeight? btnTextFontWeight,
  IconData? buttonIcon,
  Color? buttonIconColor,
  double? buttonIconSize,
  double? textFontSize,
  double? btnBorderRadius,
}) {
  return InkWell(
    onTap: ontap,
    child: Container(
      height: btnHeight ?? 30,
      width: btnWidth,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(btnBorderRadius ?? 8),
        color: btnColor ?? appBlueColor,
        border: Border.all(
          width: btnBorderWidth ?? 0,
          color: btnBorderColor ?? appBlueColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttonText!,
            style: TextStyle(
              color: btnTextColor ?? whiteColor,
              fontSize: textFontSize ?? 16,
              fontWeight: btnTextFontWeight ?? FontWeight.normal,
              fontFamily: fontFamily ?? 'Jost',
            ),
          ),
          if (buttonIcon != null) const SizedBox(width: 10),
          if (buttonIcon != null)
            Icon(
              buttonIcon,
              color: buttonIconColor ?? whiteColor,
              size: buttonIconSize!,
            ),
        ],
      ),
    ),
  );
}
