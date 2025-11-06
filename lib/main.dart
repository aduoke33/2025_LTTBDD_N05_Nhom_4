import 'package:english_forum_app/l10n/app_localizations.dart';
import 'package:english_forum_app/l10n/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:english_forum_app/screens/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return MaterialApp(
          title: 'English Forum',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          locale: languageProvider.currentLocale,
          supportedLocales: const [
            Locale('en', ''),
            Locale('vi', ''),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          // Start the app with the Login Screen
          home: const LoginScreen(),
        );
      },
    );
  }
}
