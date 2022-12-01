// import 'package:face_recognation/shared/localization/lang/lang_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:face_recognation/shared/localization/lang/lang_en.dart';
import 'package:face_recognation/shared/localization/language.dart';

class GenerateLocalizationDelegate extends LocalizationsDelegate<Language> {
  const GenerateLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("id", "ID"),
      Locale("en", "US"),
    ];
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Language> old) => false;

  @override
  bool isSupported(Locale locale) => _isSupported(locale, true);

  @override
  Future<Language> load(Locale locale) {
    final String? lang = getLang(locale);
    switch (lang) {
      case "en_US":
        Language.current = LangEn();
        return SynchronousFuture<Language>(Language.current!);
      case "id_ID":
        Language.current = LangEn();
        return SynchronousFuture<Language>(Language.current!);
      default:
        Language.current = LangEn();
        return SynchronousFuture<Language>(Language.current!);
    }
  }

  bool _isSupported(Locale? locale, bool withCountry) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode != locale.languageCode) {
          continue;
        }

        if (supportedLocale.countryCode == locale.countryCode) {
          return true;
        }

        if (supportedLocale.countryCode == null ||
            supportedLocale.countryCode!.isEmpty) {
          return true;
        }

        if (true != withCountry &&
            (supportedLocale.countryCode == null ||
                supportedLocale.countryCode!.isEmpty)) {
          return true;
        }
      }
    }
    return false;
  }
}

String? getLang(Locale? locale) => locale == null
    ? null
    : locale.countryCode != null && locale.countryCode!.isEmpty
        ? locale.languageCode
        : locale.toString();
