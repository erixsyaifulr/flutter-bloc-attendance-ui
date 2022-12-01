import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:face_recognation/shared/constant/palette.dart';
import 'package:face_recognation/shared/widget/loader/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:intl/intl.dart';

double mediaQueryWidth(BuildContext context) =>
    MediaQuery.of(context).size.width;
double mediaQueryHeight(BuildContext context) =>
    MediaQuery.of(context).size.height;

DateFormat idDateFormat = DateFormat("EEEE, d MMMM yyyy", "id_ID");

dynamic showLoading() {
  return SmartDialog.showLoading(
    animationType: SmartAnimationType.scale,
    builder: (_) => const CustomLoading(),
  );
}

dynamic closeLoading() {
  return SmartDialog.dismiss();
}

void showSuccessDialog(BuildContext context, String content) => AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: "Yeay!",
      desc: content,
      btnOkOnPress: () {},
    )..show();

void showErrorDialog(BuildContext context, String content) => AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.scale,
      title: "Oops!",
      desc: content,
      btnOkColor: Palette.green,
      btnOkOnPress: () {},
    )..show();

void showWarningDialog(BuildContext context, String content) => AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.scale,
      title: "Attention!",
      desc: content,
      btnOkColor: Palette.green,
      btnOkOnPress: () {},
    )..show();

void showConfirmationDialog(
        BuildContext context, description, Function() onOk) =>
    AwesomeDialog(
        context: context,
        dialogType: DialogType.question,
        animType: AnimType.scale,
        title: "Confirmation ?",
        desc: description,
        btnCancelText: "Cancel",
        btnOkText: "Ok",
        btnOkColor: Palette.green,
        btnOkOnPress: onOk,
        btnCancelOnPress: () {})
      ..show();
