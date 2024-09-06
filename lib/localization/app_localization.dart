
import 'package:flutter/material.dart';

enum LocKey {
    getStart,
    language,
    khmerLanguage,
    englishLanguage
}

class AppLocalization {

  final Locale locale;

  AppLocalization(this.locale);

  static AppLocalization? of(BuildContext ctx) => Localizations.of<AppLocalization>(ctx, AppLocalization);

  // Option 1
  static Map<String, Map<LocKey,String>> data = {
      "en":{
        LocKey.getStart:"Get Started",
        LocKey.language:"Langauge",
        LocKey.khmerLanguage:"Khmer Langauge",
        LocKey.englishLanguage:"English Langauge"
      },
      "km":{
        LocKey.getStart:"ចាប់ផ្តើម",
        LocKey.language:"ភាសារ",
        LocKey.khmerLanguage:"ភាសារខ្មែរ",
        LocKey.englishLanguage:"ភាសារអង់គ្លេស"
    }
  };

    String translate(LocKey key){
      final languageCode = locale.languageCode;
      return data[languageCode]?[key] ?? "";
    }
}