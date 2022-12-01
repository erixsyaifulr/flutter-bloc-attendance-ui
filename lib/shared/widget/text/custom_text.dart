import 'package:face_recognation/shared/constant/palette.dart';
import 'package:face_recognation/shared/constant/util.dart';
import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? fontHeight;
  const CustomText({
    Key? key,
    required this.text,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.fontHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 4,
      overflow: overflow ?? TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
        color: color ?? Palette.black,
        fontSize: fontSize ?? Util.fontSize14,
        fontWeight: fontWeight ?? FontWeight.normal,
        height: fontHeight ?? 1.5,
      ),
    );
  }
}
