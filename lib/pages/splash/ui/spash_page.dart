import 'package:face_recognation/core/route_generator/routes.dart';
import 'package:face_recognation/pages/splash/bloc/splash_bloc.dart';
import 'package:face_recognation/shared/constant/assets.dart';
import 'package:face_recognation/shared/constant/palette.dart';
import 'package:face_recognation/shared/helper/helper.dart';
import 'package:face_recognation/shared/widget/appbar/base_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashEnded) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.login,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: appBar(),
          body: Container(
            color: Palette.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  logo(context),
                  loading(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  AppBar appBar() {
    return baseAppBar(
      withBackButton: false,
      backgroundColor: Palette.white,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Palette.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  Widget logo(BuildContext context) {
    return Image.asset(
      Assets.icAppLogo,
      width: mediaQueryWidth(context) * 0.5,
    );
  }

  Widget loading() {
    return Lottie.asset(
      Assets.ltLoading,
      alignment: Alignment.center,
    );
  }
}
