import 'package:face_recognation/shared/constant/palette.dart';
import 'package:face_recognation/shared/constant/util.dart';
import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final bool? hasGradient;
  final Widget? child;
  final AlignmentGeometry? gradientBegin;
  final AlignmentGeometry? gradientEnd;
  final Color? beginColor;
  final Color? endColor;

  const CircleContainer({
    Key? key,
    this.width,
    this.height,
    this.color,
    this.hasGradient = false,
    this.child,
    this.gradientBegin,
    this.gradientEnd,
    this.beginColor,
    this.endColor,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(Util.defaultPadding),
      margin: margin ?? const EdgeInsets.all(Util.defaultMargin),
      width: width ?? Util.widthHeight100,
      height: height ?? Util.widthHeight100,
      decoration: BoxDecoration(
        color: color ?? Palette.primary,
        shape: BoxShape.circle,
        gradient: hasGradient!
            ? LinearGradient(
                begin: gradientBegin ?? Alignment.centerRight,
                end: gradientEnd ?? Alignment.centerLeft,
                colors: [
                  beginColor ?? Palette.primaryLight2,
                  endColor ?? Palette.primary,
                ],
              )
            : null,
      ),
      child: child ?? const SizedBox(),
    );
  }
}
