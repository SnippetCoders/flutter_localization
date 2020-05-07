
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = Locale('en');

  Locale get appLocale => _appLocale ?? Locale("en");

  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();

    if (prefs.getString("language_code") == null) {
      _appLocale = Locale('en');

      return null;
    }
    _appLocale = Locale(prefs.getString('language_code'));
    return null;
  }

  changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();

    if(_appLocale == type) {
      return;
    }

    _appLocale = type;
    await prefs.setString('language_code', type.languageCode);
    await prefs.setString('countryCode', type.countryCode);

    notifyListeners();
  }
}

