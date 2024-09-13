import 'package:flutter/material.dart';
import 'package:mad3/localization/app_localization.dart';
import 'package:mad3/routes.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.of(context)!.translate(LocKey.more)),
        centerTitle: true,
        elevation: 2,
      ),
      body: ListView(
        children: [
          _buildLanguage
        ],
      ),
    );
  }

  Widget get _buildLanguage {
    final cardLanguage = Card(
      child: ListTile(
        leading: Icon(Icons.language),
        title: Text(AppLocalization.of(context)!.translate(LocKey.language)),
        trailing: Icon(Icons.navigate_next),
        onTap: (){
          Navigator.pushNamed(context, RouteGenerator.languagePage);
        },
      ),
    );
    return cardLanguage;
  }
}
