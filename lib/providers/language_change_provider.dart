import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChangeProvider extends ChangeNotifier {
  Locale? _appLocal;
  Locale? get applocal => _appLocal;

  Future<void> changeLanguage(Locale languageType) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _appLocal = languageType;
    if (languageType == const Locale('en')) {
      await sp.setString('language_code', 'en');
    } else {
      await sp.setString('language_code', 'es');
    }
    notifyListeners();
  }

}



// import 'dart:ui';
// import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class LanguageChangeProvider extends ChangeNotifier {
//   Locale? _appLocal;
//   Locale? get applocal => _appLocal;
//
//   void changeLanguage(Locale languageType) async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     _appLocal = languageType;
//     if (languageType == const Locale('en')) {
//       await sp.setString('language_code', 'en');
//     } else {
//       await sp.setString('language_code', 'es');
//     }
//     notifyListeners();
//   }
// }
