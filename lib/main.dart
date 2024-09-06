import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:mad3/localization/localization_delegate.dart';
import 'package:mad3/provider/language_provider.dart';
import 'package:mad3/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LanguageProvider languageProvider = LanguageProvider();
  languageProvider.fetchLanguage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = ChangeNotifierProvider(

      create: (BuildContext context)  => LanguageProvider(),
      builder: (context, child){

        LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);

        return MaterialApp(
          title: 'MAD II',
          theme: ThemeData(
            primarySwatch: Colors.lightBlue  ,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: false,
          ),
          initialRoute: RouteGenerator.splashPage,
          onGenerateRoute: RouteGenerator.routeGenerate,
          navigatorKey: RouteGenerator.key,

          locale: languageProvider.appLocal,
          supportedLocales: [
            Locale("en","US"),
            Locale("km","KH")
          ],
          localizationsDelegates: [
            AppLocalizationDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          debugShowCheckedModeBanner: false,
        );
      },
    );

    return provider;
  }
}