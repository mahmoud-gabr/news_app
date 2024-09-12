import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsViewModel with ChangeNotifier {
  String language = 'en';
  SettingsViewModel() {
    loadSettings();
  }
  Future<void> saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);
  }
  Future<void> loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLanguage = prefs.getString('language');
    if (savedLanguage != null) {
      language = savedLanguage;
    }
    notifyListeners();
  }

  void changLanguge(String selectedLanguage) {
    language = selectedLanguage;
    saveSettings();
    notifyListeners();
  }
}