import 'package:face_recognation/shared/constant/assets.dart';
import 'package:face_recognation/shared/constant/util.dart';
import 'package:flutter/material.dart';

class CustomLoading extends StatefulWidget {
  const CustomLoading({Key? key}) : super(key: key);

  @override
  State<CustomLoading> createState() => _CustomLoadingState();
}

class _CustomLoadingState extends State<CustomLoading>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    controller.forward();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reset();
        controller.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildLoading() {
      return Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            Assets.icKasuari,
            height: Util.widthHeight70,
            width: Util.widthHeight70,
          ),
          RotationTransition(
            alignment: Alignment.center,
            turns: controller,
            child: Image.asset(
              Assets.imgLoader,
              height: Util.widthHeight100,
              width: Util.widthHeight100,
            ),
          ),
        ],
      );
    }

    return Stack(
      children: [
        Visibility(
          visible: true,
          child: buildLoading(),
        ),
      ],
    );
  }
}
