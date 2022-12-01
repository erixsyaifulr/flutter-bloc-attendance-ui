import 'package:flutter/material.dart';
import 'package:face_recognation/shared/localization/language.dart';

class LangEn extends Language {
  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get hintEmail => "Your email";

  @override
  String get hintPassword => "Your password";

  @override
  String get dontHaveAccount => "Don’t have an Account ? ";

  @override
  String get login => "Login";

  @override
  String get register => "Register";

  @override
  String get hasPresence =>
      "You are present today, Thank you and always keep spirit!";

  @override
  String get home => "Home";

  @override
  String get attendance => "Attendances";

  @override
  String get profile => "Profile";

  @override
  String get arrive => "Arrive";

  @override
  String get sick => "Sick";

  @override
  String get leave => "leave";

  @override
  String get skip => "Skip";

  @override
  String get thisWeek => "This Week";

  @override
  String get thisMonth => "This Month";

  @override
  String get thisSemester => "This Semester";

  @override
  String get myAttendance => "My Attendance";

  @override
  String get faceRecognition => "Face Recognition";

  @override
  String get faceRecognitionDescription =>
      "Scan your face to verify your identity";
}
