import 'package:face_recognation/shared/constant/palette.dart';
import 'package:face_recognation/shared/constant/util.dart';
import 'package:face_recognation/shared/widget/text/custom_text.dart';
import 'package:flutter/material.dart';

class LabelContainer extends StatelessWidget {
  final String? text;
  final Color? textColor;
  const LabelContainer({
    Key? key,
    required this.text,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        Util.widthHeight5,
      ),
      margin: const EdgeInsets.only(
        right: Util.widthHeight5,
      ),
      decoration: const BoxDecoration(
        color: Palette.secondary,
        borderRadius: BorderRadius.all(
          Radius.circular(Util.radius10),
        ),
      ),
      child: CustomText(
        text: text!,
        color: textColor ?? Palette.primary,
      ),
    );
  }
}
