import 'package:face_recognation/shared/constant/palette.dart';
import 'package:face_recognation/shared/constant/util.dart';
import 'package:face_recognation/shared/widget/custom_widget/custom_container.dart';
import 'package:face_recognation/shared/widget/text/custom_text.dart';
import 'package:flutter/material.dart';

class CounterContainer extends StatelessWidget {
  final String? counter;
  final String? label;
  const CounterContainer({
    Key? key,
    required this.counter,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: Util.widthHeight70,
      height: Util.widthHeight70,
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(right: Util.widthHeight15),
      borderRadius: BorderRadius.circular(Util.radius10),
      borderColor: Palette.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: counter!,
            fontSize: Util.fontSize20,
            fontWeight: FontWeight.bold,
          ),
          CustomText(
            text: label!,
            fontSize: Util.fontSize12,
          ),
        ],
      ),
    );
  }
}
