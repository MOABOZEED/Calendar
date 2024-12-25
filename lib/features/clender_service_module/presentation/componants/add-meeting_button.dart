import 'package:calendar/core/widget/Customtext.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/color_constant.dart';
import 'meeting_dialog.dart';

class AddMeetingButton extends StatelessWidget {
  final String?text;
  final Function()?onTap;
  const AddMeetingButton({
    this.onTap,this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap:onTap ,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ColorConstant.blueColor,
          ),
          child:  Padding(
            padding: EdgeInsets.all(15.0),
            child: CustomText(text:
              text??"",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
