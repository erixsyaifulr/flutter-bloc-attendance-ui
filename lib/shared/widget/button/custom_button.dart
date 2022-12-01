import 'package:face_recognation/shared/constant/palette.dart';
import 'package:face_recognation/shared/constant/util.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final bool? active, withIcon;
  final IconData? icon;
  final Color? textColor;
  final double? borderWidth;
  final double? buttonWidth;
  final EdgeInsetsGeometry? margin;
  final Function()? onPressed;

  const CustomButton({
    Key? key,
    required this.title,
    this.withIcon = false,
    this.active = true,
    this.icon,
    this.textColor,
    this.borderWidth,
    this.buttonWidth,
    this.margin,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth ?? MediaQuery.of(context).size.width,
      height: buttonWidth ?? Util.widthHeight48,
      margin: margin ?? const EdgeInsets.all(Util.defaultMargin),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            active! ? Palette.primary : Palette.grey,
          ),
          foregroundColor: MaterialStateProperty.all(
            active! ? Palette.primary : Palette.grey,
          ),
          splashFactory:
              active! ? InkSplash.splashFactory : NoSplash.splashFactory,
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Util.defaultRadius),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            withIcon!
                ? Container(
                    margin: const EdgeInsets.only(
                      right: Util.defaultMargin,
                    ),
                    child: Icon(
                      icon,
                      size: Util.widthHeight20,
                      color: Palette.white,
                    ),
                  )
                : const SizedBox(),
            Text(
              "$title",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: textColor ?? Palette.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
