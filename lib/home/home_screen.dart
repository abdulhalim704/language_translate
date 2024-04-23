import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:language/providers/language_change_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum Language { english, spanish }

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<LanguageChangeProvider>(builder: (context,provider,_){
            return PopupMenuButton(
              onSelected: (Language item){
                if(Language.english.name == item.name){
                  provider.changeLanguage(Locale('en'));
                }else{
                  provider.changeLanguage(Locale('es'));
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Language>>[
                PopupMenuItem(
                  value: Language.english,
                  child: Text('English'),
                ),
                PopupMenuItem(
                  value: Language.spanish,
                  child: Text('Spanish'),
                ),

              ],
            );
          })
        ],
        title: Text(AppLocalizations.of(context)!.helloWorld),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppLocalizations.of(context)!.login),
        ],
      ),
    );
  }
}
