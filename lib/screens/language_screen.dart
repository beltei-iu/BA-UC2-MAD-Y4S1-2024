import 'package:flutter/material.dart';
import 'package:mad3/localization/app_localization.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  bool _isKhmer = true;

  @override
  Widget build(BuildContext context) {
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
                  value: _isKhmer, onChanged: (v){
                    setState(() {
                      _isKhmer = true;
                    });
              }),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(AppLocalization.of(context)!.translate(LocKey.englishLanguage)),
              trailing: Checkbox(
                  value: !_isKhmer, onChanged: (v){
                    setState(() {
                      _isKhmer = false;

                    });
              }),
            ),
          )
        ],
      ),
    );
  }
}
