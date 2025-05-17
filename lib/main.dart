import 'package:flutter/material.dart';
import 'package:listed_food/screens/home.dart';
import 'package:listed_food/constants/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:listed_food/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode? _themeMode;
  late SharedPreferences prefs;

  // Метод для обновления локали
  void setLocale(Locale newLocale) {
     prefs.setString('language', newLocale.languageCode);
    setState(() {
      _locale = newLocale;
    });
  }

  void setThemeMode(ThemeMode newThemeMode) {
    debugPrint(newThemeMode.toString());
    prefs.setString('theme', newThemeMode.name.toString());
    setState(() {
      _themeMode = newThemeMode;
    });
  }
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      this.prefs = prefs;
      setState(() {
        _locale = Locale(prefs.getString('language')!);
        _themeMode = themeFromString(prefs.getString('theme')!);
      });
    });
  }

  Locale? get locale => _locale;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      locale: _locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', ''), Locale('ru', '')],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: const Home(),
    );
  }
}
