
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mad3/localization/app_localization.dart';

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  
  @override
  bool isSupported(Locale locale) {
    return ["en","km"].contains(locale.languageCode);
  }

  // ========Option 1
  // @override
  // Future<AppLocalization> load(Locale locale) async {
  //   return SynchronousFuture<AppLocalization>(
  //       AppLocalization(locale)
  //    );
  // }

  // ========Option 2
  @override
  Future<AppLocalization> load(Locale locale) async =>
      SynchronousFuture<AppLocalization>(
        AppLocalization(locale)
     );
      
    
  // Option 1
  // @override
  // bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) {
  //   return false;
  // }

  // Option 2
  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) => false;

}