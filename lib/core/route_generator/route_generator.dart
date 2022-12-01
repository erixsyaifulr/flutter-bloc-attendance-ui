import 'package:face_recognation/core/route_generator/routes.dart';
import 'package:face_recognation/pages/login/bloc/login_bloc.dart';
import 'package:face_recognation/pages/login/ui/login_page.dart';
import 'package:face_recognation/pages/main/bloc/main_bloc.dart';
import 'package:face_recognation/pages/main/ui/main_page.dart';
import 'package:face_recognation/pages/splash/ui/spash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  static Route<dynamic> routes(RouteSettings settings) {
    try {
      switch (settings.name) {
        case Routes.splash:
          return MaterialPageRoute(builder: (_) => const SplashPage());
        case Routes.login:
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => LoginBloc()..add(LoginStart()),
              child: const LoginPage(),
            ),
          );
        case Routes.main:
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => MainBloc()..add(MainStart()),
              child: const MainPage(),
            ),
          );

        default:
          return errorRoute();
      }
    } on Exception {
      return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(elevation: 0, title: const Text("Oops!")),
        body: const Center(child: Text("Page not found!")),
      );
    });
  }
}
