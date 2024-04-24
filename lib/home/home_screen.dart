// home_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language/providers/language_change_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  final LanguageChangeController languageController =
  Get.find(); // Get the instance of LanguageChangeController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            onSelected: (String languageCode) {
              languageController.changeLanguage(languageCode);
              Get.updateLocale(Locale(languageCode)); // Force update locale
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem(
                value: 'en_US',
                child: Text('English'),
              ),
              PopupMenuItem(
                value: 'ur_PK',
                child: Text('Pakistan')),
              PopupMenuItem(
                value: 'zh_CN',
                child: Text('China'),
              ),
            ],
          ),
        ],
        title: Text('name'.tr),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('login'.tr),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:language/providers/language_change_provider.dart';
// import 'package:provider/provider.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// enum Language { english, spanish, chiness }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           Consumer<LanguageChangeProvider>(builder: (context, provider, _) {
//             return PopupMenuButton(
//               onSelected: (Language item) {
//                 if (Language.english.name == item.name) {
//                   provider.changeLanguage(Locale('en'));
//                 } else if (Language.chiness.name == item.name) {
//                   provider.changeLanguage(Locale('zh'));
//                 } else {
//                   provider.changeLanguage(Locale('es'));
//                 }
//               },
//               itemBuilder: (BuildContext context) => <PopupMenuEntry<Language>>[
//                 PopupMenuItem(
//                   value: Language.english,
//                   child: Text('English'),
//                 ),
//                 PopupMenuItem(
//                   value: Language.spanish,
//                   child: Text('Spanish'),
//                 ),
//                 PopupMenuItem(
//                   value: Language.chiness,
//                   child: Text('Chiness'),
//                 ),
//               ],
//             );
//           })
//         ],
//         title: Text(AppLocalizations.of(context)!.helloWorld),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(AppLocalizations.of(context)!.login),
//         ],
//       ),
//     );
//   }
// }
