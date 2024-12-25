import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
        this.style,
      required this.text,
      this.maxLines,
      this.textAlign,
      this.overFlowText});

  final String text;
  final TextStyle?style;

  // final Color? textColor;
  // final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;

  // final double? height;
  final TextOverflow? overFlowText;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overFlowText,
      // style: Theme.of(context).textTheme.displayLarge?.copyWith(
      // color: widget.textColor ?? appColor(context)?.bluePrimaryColor,
      // fontWeight:widget.fontWeight,height:widget.height ,
      // ),
    );
  }
}
