// language_change_provider.dart

import 'dart:ui';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageChangeController extends GetxController {
  Locale? _appLocal;
  Locale? get applocal => _appLocal;

  Future<void> changeLanguage(String languageType) async {
    final box = GetStorage();
    _appLocal = Locale(languageType);
    await box.write('language_code', languageType); // Write language code to GetStorage
    update(); // Notify listeners to update UI
  }
}



//
// import 'dart:ui';
//
// import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class LanguageChangeProvider extends ChangeNotifier {
//   Locale? _appLocal;
//   Locale? get applocal => _appLocal;
//
//   Future<void> changeLanguage(Locale languageType) async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     _appLocal = languageType;
//     if (languageType == const Locale('en')) {
//       await sp.setString('language_code', 'en');
//     } else if (languageType == const Locale('zh')) {
//       await sp.setString('language_code', 'zh');
//     } else {
//       await sp.setString('language_code', 'es');
//     }
//     notifyListeners();
//   }
// }
