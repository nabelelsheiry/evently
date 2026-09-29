import 'package:evently/core/utils/app_theme.dart';
import 'package:evently/features/onboarding/onboarding_screen.dart';
import 'package:evently/features/splash/splash_screen.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/provider/app_language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppLanguageProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var langProvider= Provider.of<AppLanguageProvider>(context)!;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      themeMode: langProvider.theme == "light" ? ThemeMode.light : ThemeMode.dark,
      // key: ValueKey(langProvider.language),
      theme: AppTheme.theme,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        OnboardingScreen.routeName: (_) => OnboardingScreen(),
      },
      locale: Locale(langProvider.language),
      localizationsDelegates: [
        AppLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
