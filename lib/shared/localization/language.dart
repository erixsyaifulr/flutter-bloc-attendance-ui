import 'package:flutter/material.dart';

abstract class Language extends WidgetsLocalizations {
  static Language? current;

  static Language? of(BuildContext context) =>
      Localizations.of<Language>(context, Language);

  String get hintEmail;

  String get hintPassword;

  String get dontHaveAccount;

  String get login;

  String get register;

  String get hasPresence;

  String get home;

  String get attendance;

  String get profile;

  String get arrive;

  String get sick;

  String get leave;

  String get skip;

  String get thisWeek;

  String get thisMonth;

  String get thisSemester;

  String get myAttendance;

  String get faceRecognition;

  String get faceRecognitionDescription;
}
