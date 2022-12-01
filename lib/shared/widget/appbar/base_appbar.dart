import 'package:face_recognation/shared/constant/palette.dart';
import 'package:face_recognation/shared/constant/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar baseAppBar({
  Widget? title,
  SystemUiOverlayStyle? systemOverlayStyle,
  Color? backgroundColor,
  bool withIcon = false,
  IconData? leadingIcon,
  List<Widget>? actions,
  bool withBackButton = true,
}) {
  return AppBar(
    automaticallyImplyLeading: withBackButton,
    systemOverlayStyle: systemOverlayStyle ??
        const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Palette.primary,
        ),
    title: title ?? const SizedBox(),
    centerTitle: true,
    backgroundColor: backgroundColor ?? Palette.primary,
    elevation: 0,
    leading: withIcon
        ? IconButton(
            onPressed: () {},
            icon: Icon(
              leadingIcon,
              size: Util.widthHeight25,
            ),
          )
        : const SizedBox(),
    actions: actions,
  );
}
