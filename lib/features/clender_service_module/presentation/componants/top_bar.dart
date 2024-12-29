import 'package:calendar/core/utils/color_constant.dart';
import 'package:calendar/core/widget/Customtext.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/image_constant.dart';


class TopBar extends StatelessWidget {
  final Function()?onTap;
  final String? text;

  const TopBar({
    this.text,
    super.key,this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // width: double.infinity,
      height: 20.h,
      decoration:  BoxDecoration(
        image:const DecorationImage(image: AssetImage(ImageConstant.bgTopBar),fit:BoxFit.cover, ) ,
          color: ColorConstant.bluePrimaryColor,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(10),
          )),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: text!=null? GestureDetector(
                onTap: onTap,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10)),
                    child:  Padding(
                      padding:const EdgeInsets.all(10.0),
                      child: CustomText(
                        text:text ??"",
                        style:const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    )),
              ):null,
            ),

            Image.asset(
              ImageConstant.logo,
              fit: BoxFit.fill,
              width: 120,
            )
          ],
        ),
      ),
    );
  }
}