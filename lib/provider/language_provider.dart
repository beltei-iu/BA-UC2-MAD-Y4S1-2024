
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LanguageProvider extends ChangeNotifier{

  Locale _appLocale = Locale("en");

  Locale get appLocal => _appLocale;

  fetchLanguage() async{
    final pref = await SharedPreferences.getInstance();
    if(pref.getString("lang") == null){
      _appLocale = Locale("en");
      return _appLocale;
    }
    _appLocale = Locale(pref.getString("lang") ?? "en");
    return _appLocale;
  }

  void changeLanguage(Locale locale) async{
    final pref = await SharedPreferences.getInstance();
    if(locale.languageCode == _appLocale.languageCode){
      return;
    }
    if(locale == Locale("km")){
      _appLocale = Locale("km");
      await pref.setString("lang", "km");
    }else{
      _appLocale = Locale("en");
      await pref.setString("lang", "en");
    }
    notifyListeners();
  }

}