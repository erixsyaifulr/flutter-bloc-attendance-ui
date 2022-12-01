import 'package:face_recognation/core/route_generator/routes.dart';
import 'package:face_recognation/pages/login/bloc/login_bloc.dart';
import 'package:face_recognation/shared/constant/assets.dart';
import 'package:face_recognation/shared/constant/palette.dart';
import 'package:face_recognation/shared/constant/util.dart';
import 'package:face_recognation/shared/helper/helper.dart';
import 'package:face_recognation/shared/localization/language.dart';
import 'package:face_recognation/shared/widget/appbar/base_appbar.dart';
import 'package:face_recognation/shared/widget/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showLoading();
        }
        if (state is LoginFailed) {
          closeLoading();
          showErrorDialog(context, state.message!);
        }
        if (state is LoginSuccess) {
          closeLoading();
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.main,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: appBar(),
          body: body(context, loginBloc),
        );
      },
    );
  }

  AppBar appBar() {
    return baseAppBar(
      backgroundColor: Palette.white,
      withBackButton: false,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Palette.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  Widget body(
    BuildContext context,
    LoginBloc loginBloc,
  ) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          logo(context),
          const SizedBox(height: Util.defaultPadding * 2),
          loginForm(context, loginBloc),
        ],
      ),
    );
  }

  Widget logo(BuildContext context) {
    return Image.asset(
      Assets.icAppLogo,
      width: mediaQueryWidth(context) * 0.5,
    );
  }

  Widget loginForm(
    BuildContext context,
    LoginBloc loginBloc,
  ) {
    return Row(
      children: [
        const Spacer(),
        Expanded(
          flex: 8,
          child: Form(
            child: Column(
              children: [
                // Email input
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: Palette.primary,
                  onSaved: (email) {},
                  decoration: InputDecoration(
                    hintText: Language.of(context)!.hintEmail,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(Util.defaultPadding),
                      child: Icon(Icons.person),
                    ),
                  ),
                ),

                // Password input
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Util.defaultPadding,
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    cursorColor: Palette.primary,
                    decoration: InputDecoration(
                      hintText: Language.of(context)!.hintPassword,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(Util.defaultPadding),
                        child: Icon(Icons.lock),
                      ),
                    ),
                  ),
                ),

                // Login button
                CustomButton(
                  title: Language.of(context)!.login,
                  margin: const EdgeInsets.symmetric(
                    vertical: Util.defaultPadding,
                  ),
                  onPressed: () {
                    FocusManager.instance.primaryFocus!.unfocus();
                    loginBloc.add(LoginSubmit(
                      email: emailController.text,
                      password: passwordController.text,
                    ));
                  },
                ),

                // Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      Language.of(context)!.dontHaveAccount,
                      style: const TextStyle(color: Palette.primary),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        Language.of(context)!.register,
                        style: const TextStyle(
                          color: Palette.primaryDark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
