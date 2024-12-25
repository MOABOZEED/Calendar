import 'package:flutter/material.dart';

import '../../../../core/widget/Customtext.dart';

class ListTileComponent extends StatelessWidget {
  final String? text;
  final void Function()? onTap;
  final Widget?icon;

  const ListTileComponent({
    this.icon,
    this.onTap,
    this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:icon ,
      title: CustomText(text: text ?? ""),
      onTap: onTap,
    );
  }
}
