
import 'package:flutter/material.dart';

class AppLanguageProvider extends ChangeNotifier{
  String language = "en";
  String theme = "light";
  void changeLanguage(String newLanguage){
    if(language == newLanguage){
      return;
    }
    language = newLanguage;
    notifyListeners();
  }
  void changeTheme(String newTheme){
    if(theme == newTheme){
      return;
    }
    theme = newTheme;
    notifyListeners();
  }

}