import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {

  Future<void> loadInitialLanguage() async {
    Locale locale = await _getLocale();
    _currentLocale = locale;
    notifyListeners();
  }

  Locale _currentLocale = Locale("en");

  Locale get currentLocale => _currentLocale;

  void changeLocale(Locale newLocale) {
    if (_currentLocale == newLocale)
      return ;
    else {
      _currentLocale = newLocale;
      _saveLocale(currentLocale.languageCode);
      notifyListeners();
    }
  }

  Future<void> _saveLocale(String locale) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('locale', locale);
  }

  Future<Locale> _getLocale() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String savedLocale = sharedPreferences.getString('locale') ?? 'en';
    return Locale(savedLocale);
  }
}
