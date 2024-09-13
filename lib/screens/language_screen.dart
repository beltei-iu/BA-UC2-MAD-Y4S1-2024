import 'package:flutter/material.dart';
import 'package:mad3/localization/app_localization.dart';
import 'package:mad3/provider/language_provider.dart';
import 'package:provider/provider.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  @override
  Widget build(BuildContext context) {

    final languageProvider = Provider.of<LanguageProvider>(context);
    final locale = languageProvider.appLocal;

    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalization.of(context)!.translate(LocKey.language)),
          centerTitle: true,
          elevation: 2,
        ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text(AppLocalization.of(context)!.translate(LocKey.khmerLanguage)),
              trailing: Checkbox(
                  value: locale.languageCode == "km",
                  onChanged: (v){
                    final provider = Provider.of<LanguageProvider>(context, listen: false);
                    provider.changeLanguage(Locale("km"));
              }),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(AppLocalization.of(context)!.translate(LocKey.englishLanguage)),
              trailing: Checkbox(
                  value: locale.languageCode != "km",
                  onChanged: (v){
                    final provider = Provider.of<LanguageProvider>(context, listen: false);
                    provider.changeLanguage(Locale("en"));
              }),
            ),
          )
        ],
      ),
    );
  }
}
