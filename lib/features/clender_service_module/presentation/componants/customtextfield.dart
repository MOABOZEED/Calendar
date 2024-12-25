import 'package:calendar/core/utils/color_constant.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextInputAction? textInputAction;
  final String? hintText;
  final TextInputType? keyboardType;
  final Icon? suffixIcon;
  final int? maxLength;
  final bool? readOnly;
  final void Function()? onTap;
 final TextEditingController? controller;
  final Function(String)? onChanged;
  final  String?errorText;
  final String?Function(String?)?validator;

 const CustomTextField({
   this.validator,

    this.onChanged,
   this.errorText,
    super.key,
    this.controller,
    this.readOnly,
    this.maxLength,
    required this.hintText,
    this.onTap,
    required this.textInputAction,
    required this.keyboardType,
    required this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly ?? false,
      maxLength: maxLength,
      controller: controller,
      validator:validator ,
      textInputAction: textInputAction,
      textAlign: TextAlign.end,
      cursorColor: ColorConstant.bluePrimaryColor,
      keyboardType: keyboardType,
      decoration: InputDecoration(errorText:errorText ,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: ColorConstant.bluePrimaryColor,
          ),
        ),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
      ),
    );
  }
}
