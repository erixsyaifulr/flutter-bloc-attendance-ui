import 'package:face_recognation/shared/constant/palette.dart';
import 'package:face_recognation/shared/constant/util.dart';
import 'package:face_recognation/shared/widget/custom_widget/custom_container.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final TabController? controller;
  final Color? backgroundColor;
  final Color? borderColor;

  const CustomTabBar({
    Key? key,
    required this.tabs,
    this.controller,
    this.backgroundColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      height: Util.widthHeight40,
      borderRadius: BorderRadius.zero,
      backgroundColor: backgroundColor ?? Palette.white,
      borderColor: borderColor ?? Palette.white,
      child: TabBar(
        controller: controller,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(Util.radius15),
          color: Palette.secondary,
          border: Border.all(color: Palette.primary),
        ),
        labelColor: Palette.primaryDark,
        unselectedLabelColor: Palette.grey,
        tabs: tabs,
      ),
    );
  }
}
