import 'package:flutter/material.dart';
import 'package:face_recognation/shared/localization/language.dart';

class LangId extends Language {
  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get hintEmail => "Email anda";

  @override
  String get hintPassword => "Kata sandi anda";

  @override
  String get dontHaveAccount => "Belum mempunyai akun ? ";

  @override
  String get login => "Masuk";

  @override
  String get register => "Registrasi";

  @override
  String get hasPresence =>
      "Anda sudah presensi hari ini, Terima kasih dan semangat selalu!";

  @override
  String get home => "Beranda";

  @override
  String get attendance => "Kehadiran";

  @override
  String get profile => "Profil";

  @override
  String get arrive => "Hadir";

  @override
  String get sick => "Sakit";

  @override
  String get leave => "Izin";

  @override
  String get skip => "Alpa";

  @override
  String get thisWeek => "Minggu Ini";

  @override
  String get thisMonth => "Bulan Ini";

  @override
  String get thisSemester => "Semester Ini";

  @override
  String get myAttendance => "Kehadairanku";

  @override
  String get faceRecognition => "Scan Wajah";

  @override
  String get faceRecognitionDescription =>
      "Pindai wajah Anda untuk memverifikasi identitas Anda";
}
