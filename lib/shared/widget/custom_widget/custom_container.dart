import 'package:face_recognation/shared/constant/palette.dart';
import 'package:face_recognation/shared/constant/util.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? borderColor;
  final Alignment? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final Decoration? decoration;
  final BorderRadiusGeometry? borderRadius;

  const CustomContainer({
    Key? key,
    this.alignment,
    this.padding,
    this.margin,
    this.child,
    this.width,
    this.height,
    this.backgroundColor,
    this.decoration,
    this.borderColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? MediaQuery.of(context).size.height,
      alignment: alignment ?? Alignment.center,
      padding: padding ??
          const EdgeInsets.all(
            Util.defaultPadding,
          ),
      margin: margin ?? const EdgeInsets.all(Util.defaultMargin),
      decoration: decoration ??
          BoxDecoration(
            color: backgroundColor ?? Palette.secondary,
            borderRadius:
                borderRadius ?? BorderRadius.circular(Util.defaultRadius),
            border: Border.all(color: borderColor ?? Palette.grey, width: 1),
          ),
      child: child ?? const SizedBox(),
    );
  }
}
