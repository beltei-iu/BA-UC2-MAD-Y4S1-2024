import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mad3/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mad3/localization/localization_delegate.dart';
import 'package:mad3/provider/language_provider.dart';
import 'package:mad3/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  LanguageProvider languageProvider = LanguageProvider();
  await languageProvider.fetchLanguage();
  runApp( MyApp(languageProvider:  languageProvider,));
}

class MyApp extends StatelessWidget {

  LanguageProvider languageProvider;

  MyApp({super.key, required this.languageProvider});

  @override
  Widget build(BuildContext context) {

    final provider = ChangeNotifierProvider(

      create: (BuildContext context)  => languageProvider,
      builder: (context, child){

        final language = Provider.of<LanguageProvider>(context);

        return MaterialApp(
          title: 'MAD II',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF018AAA)),
            useMaterial3: false,
            primaryColor: const Color(0xFF018AAA)
          ),
          initialRoute: RouteGenerator.registerScreen,
          onGenerateRoute: RouteGenerator.routeGenerate,
          navigatorKey: RouteGenerator.key,
          locale: language.appLocal,
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