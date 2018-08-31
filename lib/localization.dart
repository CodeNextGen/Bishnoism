import 'package:flutter/material.dart';
import 'dart:async';

class AppLocalizations {

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(
        context,
        AppLocalizations
    );
  }

  String get appTitle => "plantly";
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {

  @override
  bool isSupported(Locale locale) {
    if (locale.languageCode.toLowerCase().contains("en")) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<AppLocalizations> load(Locale locale) => new Future(() => new AppLocalizations());

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}