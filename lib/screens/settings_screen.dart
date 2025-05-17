import 'package:flutter/material.dart';
import 'package:listed_food/generated/l10n.dart';
import 'package:listed_food/utils/utils.dart';
import 'package:listed_food/widgets/page_template.dart';
import 'package:listed_food/main.dart';
import 'package:listed_food/widgets/settings_widgets/select_menu_type.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Импортируем, чтобы обратиться к MyAppState

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  // Локальная переменная для хранения выбранного языка
  String? _selectedLanguage = 'en';
  String? _selectedTheme = 'system';
  late SharedPreferences prefs;

  late MyAppState appState;

  @override
  void initState() { // todo: возможен баг
    super.initState();
    appState = context.findAncestorStateOfType<MyAppState>()!;

    SharedPreferences.getInstance().then((value) {
      prefs = value;
      _selectedLanguage = prefs.getString('language') ?? Localizations.localeOf(context).languageCode;
      if (!languages.contains(_selectedLanguage)) {
        _selectedLanguage = 'en';
      }
      _selectedTheme = prefs.getString('theme') ?? 'system';
      setState(() {});
    });
  }

  String languageName(String code) {
    switch (code) {
      case 'en':
        return S.of(context).english;
      case 'ru':
        return S.of(context).russian;
      default:
        return '';
    }
  }

  List<String> get languages =>
      S.delegate.supportedLocales.map((e) => e.languageCode).toList();


  @override
  Widget build(BuildContext context) {
    if (_selectedLanguage == null || _selectedTheme == null) {
      return Container();
    }

    debugPrint('selectedLanguage: $_selectedLanguage');
    debugPrint('selectedTheme: $_selectedTheme');

    return PageTemplate(
      title: S.of(context).settings,
      back: true,
      child: Padding(
        padding: EdgeInsets.all(
          Theme.of(context).textTheme.bodyMedium!.fontSize ?? 16,
        ),

        child: Column(
          children: [
            Row(
              children: [
                Text(S.of(context).app_theme),
                const Spacer(),
                DropdownButton<String>(
                  value: _selectedTheme ?? 'system',
                  underline: Container(),
                  alignment:  AlignmentDirectional.centerEnd,
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() { _selectedTheme = value; });
                      appState.setThemeMode(themeFromString(value));
                    }
                  },
                  items: [
                    DropdownMenuItem<String>(
                      value: 'system',
                      child: Text(S.of(context).default_theme),
                    ),
                    DropdownMenuItem<String>(
                      value: 'light',
                      child: Text(S.of(context).light_theme),
                    ),
                    DropdownMenuItem<String>(
                      value: 'dark',
                      child: Text(S.of(context).dark_theme),
                    ),
                  ],
                ),
              ],
            ),

            Row(
              children: [
                Text(S.of(context).language),
                const Spacer(),
                DropdownButton<String>(
                  value: _selectedLanguage,
                  underline: Container(),
                  // используем Container() вместо null для устранения предупреждения
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() {
                        _selectedLanguage = value;
                      });
                      // При выборе меняем локаль приложения
                      appState.setLocale(Locale(value, ''));
                    }
                  },
                  items:
                      languages.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(languageName(value)),
                        );
                      }).toList(),
                ),
              ],
            ),

            SelectMenuType(),
          ],
        ),
      ),
    );
  }
}
