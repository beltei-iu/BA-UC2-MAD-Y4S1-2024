
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LanguageProvider extends ChangeNotifier{

  Locale _locale = Locale("en");

  Locale get appLocal => _locale;

  fetchLanguage() async{
    final pref = await SharedPreferences.getInstance();
    if(pref.getString("lang") != null){
      _locale = Locale(pref.getString("lang") ?? "en");
    }
    return _locale;
  }

  void changeLanguage(Locale locale) async{
    final pref = await SharedPreferences.getInstance();
    if(locale == _locale){
      return;
    }
    pref.setString("lang", locale.languageCode);
    notifyListeners();
  }

}