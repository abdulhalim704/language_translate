// main.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:language/home/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:language/home/languages.dart';
import 'package:language/providers/language_change_provider.dart';

void main() async {
  await GetStorage.init(); // Initialize GetStorage
  final languageCode =
      GetStorage().read('language_code') ?? 'en_US'; // Read language code from GetStorage
  runApp(MyApp(locale: languageCode));
}

class MyApp extends StatelessWidget {
  final String locale;
  final LanguageChangeController languageController =
  Get.put(LanguageChangeController());

  MyApp({Key? key, required this.locale}) : super(key: key) {
    // Read the language code from GetStorage at startup and pass it to LanguageChangeController
    final String languageCode =
        GetStorage().read('language_code') ?? 'en_US'; // Default to English if not found
    languageController.changeLanguage(languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
      translations: Languages(), // Declare translations
      locale: Locale(locale), // Set initial locale
      fallbackLocale: Locale('en', 'US'), // Set fallback locale
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:language/home/home_screen.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:language/providers/language_change_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences sp = await SharedPreferences.getInstance();
//   final String languageCode = sp.getString('language_code') ??
//       ''; //first time user open app, then her language is empty by default language show english
//   runApp(MyApp(
//     locale: languageCode,
//   ));
// }
//
// class MyApp extends StatefulWidget {
//   final String locale;
//
//   const MyApp({Key? key, required this.locale}) : super(key: key);
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//    late LanguageChangeProvider _languageChangeProvider;
//
//   @override
//   void initState() {
//     super.initState();
//     _languageChangeProvider = LanguageChangeProvider();
//     _initializeLanguage();
//   }
//
//   Future<void> _initializeLanguage() async {
//     final String initialLanguageCode =
//     widget.locale.isEmpty ? 'en' : widget.locale;
//     final Locale initialLocale = Locale(initialLanguageCode);
//     await _languageChangeProvider.changeLanguage(initialLocale);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider.value(value: _languageChangeProvider),
//       ],
//       child: Consumer<LanguageChangeProvider>(
//         builder: (context, provider, _) {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             locale: provider.applocal,
//             title: 'Flutter Demo',
//             localizationsDelegates: const [
//               AppLocalizations.delegate,
//               GlobalCupertinoLocalizations.delegate,
//               GlobalMaterialLocalizations.delegate,
//               GlobalWidgetsLocalizations.delegate,
//             ],
//             supportedLocales: const [Locale('en'), Locale('es'),Locale('zh')],
//             theme: ThemeData(
//               colorScheme:
//               ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//               useMaterial3: true,
//             ),
//             home: const HomeScreen(),
//           );
//         },
//       ),
//     );
//   }
// }
//
//
//
//
