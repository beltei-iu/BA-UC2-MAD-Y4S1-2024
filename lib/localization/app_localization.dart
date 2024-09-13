
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum LocKey {
    getStart,
    language,
    khmerLanguage,
    englishLanguage,
    home,
    classroom,
    more
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

  Map<String,String>? _localizedStrings;
  // Option 2
  Future<bool> load() async {
    // Load file from JSON
    String jsonString = await rootBundle.loadString('assets/langs/${locale.languageCode}.json');
    Map<String,dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key,value) => MapEntry(key, value.toString()));
    return true;
  }

  String translate(LocKey key){
    // final languageCode = locale.languageCode;
    //return data[languageCode]?[key] ?? "";
    return _localizedStrings?[key.name] ?? key.name;
  }


  // String translate(LocKey key){
  //   final languageCode = locale.languageCode;
  //   return data[languageCode]?[key] ?? "";
  // }
}