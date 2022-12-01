import 'package:face_recognation/core/route_generator/route_generator.dart';
import 'package:face_recognation/core/route_generator/routes.dart';
import 'package:face_recognation/pages/splash/bloc/splash_bloc.dart';
import 'package:face_recognation/shared/constant/palette.dart';
import 'package:face_recognation/shared/constant/util.dart';
import 'package:face_recognation/shared/localization/generate_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashBloc()..add(SplashStarted()),
          lazy: true,
        ),
      ],
      child: MaterialApp(
        initialRoute: Routes.splash,
        onGenerateRoute: RouteGenerator.routes,
        debugShowCheckedModeBanner: false,
        builder: FlutterSmartDialog.init(),
        theme: ThemeData(
          primaryColor: Palette.primary,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          scaffoldBackgroundColor: Palette.white,
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Palette.secondary,
            iconColor: Palette.primary,
            prefixIconColor: Palette.primary,
            contentPadding: EdgeInsets.symmetric(
              horizontal: Util.defaultPadding,
              vertical: Util.defaultPadding,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        localizationsDelegates: const [
          GenerateLocalizationDelegate(),
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const GenerateLocalizationDelegate().supportedLocales,
      ),
    );
  }
}
