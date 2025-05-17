// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `You have pushed the button this many times:`
  String get howManuTimesYouPressed {
    return Intl.message(
      'You have pushed the button this many times:',
      name: 'howManuTimesYouPressed',
      desc: '',
      args: [],
    );
  }

  /// `Increment`
  String get incrementTooltip {
    return Intl.message(
      'Increment',
      name: 'incrementTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Demo Home Page`
  String get homepageTitle {
    return Intl.message(
      'Flutter Demo Home Page',
      name: 'homepageTitle',
      desc: '',
      args: [],
    );
  }

  /// `product name`
  String get CheckEditListElementStateMainInputHint {
    return Intl.message(
      'product name',
      name: 'CheckEditListElementStateMainInputHint',
      desc: '',
      args: [],
    );
  }

  /// `amount`
  String get CheckEditListElementStateMeasurementInputHint {
    return Intl.message(
      'amount',
      name: 'CheckEditListElementStateMeasurementInputHint',
      desc: '',
      args: [],
    );
  }

  /// `kg`
  String get kilogram {
    return Intl.message('kg', name: 'kilogram', desc: '', args: []);
  }

  /// `g`
  String get gram {
    return Intl.message('g', name: 'gram', desc: '', args: []);
  }

  /// `ml`
  String get milliliter {
    return Intl.message('ml', name: 'milliliter', desc: '', args: []);
  }

  /// `l`
  String get liter {
    return Intl.message('l', name: 'liter', desc: '', args: []);
  }

  /// `pcs`
  String get piece {
    return Intl.message('pcs', name: 'piece', desc: '', args: []);
  }

  /// `Add element`
  String get addElement {
    return Intl.message('Add element', name: 'addElement', desc: '', args: []);
  }

  /// `List`
  String get foodList {
    return Intl.message('List', name: 'foodList', desc: '', args: []);
  }

  /// `Recipes`
  String get recipesList {
    return Intl.message('Recipes', name: 'recipesList', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Products`
  String get productList {
    return Intl.message('Products', name: 'productList', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Русский`
  String get russian {
    return Intl.message('Русский', name: 'russian', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Theme`
  String get app_theme {
    return Intl.message('Theme', name: 'app_theme', desc: '', args: []);
  }

  /// `Default`
  String get default_theme {
    return Intl.message('Default', name: 'default_theme', desc: '', args: []);
  }

  /// `Light`
  String get light_theme {
    return Intl.message('Light', name: 'light_theme', desc: '', args: []);
  }

  /// `Dark`
  String get dark_theme {
    return Intl.message('Dark', name: 'dark_theme', desc: '', args: []);
  }

  /// `Meal List`
  String get mealList {
    return Intl.message('Meal List', name: 'mealList', desc: '', args: []);
  }

  /// `Any`
  String get anyMT {
    return Intl.message('Any', name: 'anyMT', desc: '', args: []);
  }

  /// `Vegetarian`
  String get vegetarianMT {
    return Intl.message('Vegetarian', name: 'vegetarianMT', desc: '', args: []);
  }

  /// `Lenten`
  String get lentenMT {
    return Intl.message('Lenten', name: 'lentenMT', desc: '', args: []);
  }

  /// `Family`
  String get familyMT {
    return Intl.message('Family', name: 'familyMT', desc: '', args: []);
  }

  /// `Fast`
  String get fastMT {
    return Intl.message('Fast', name: 'fastMT', desc: '', args: []);
  }

  /// `AI Generated`
  String get aiGeneratedMT {
    return Intl.message(
      'AI Generated',
      name: 'aiGeneratedMT',
      desc: '',
      args: [],
    );
  }

  /// `Select menu type`
  String get selectMenuType {
    return Intl.message(
      'Select menu type',
      name: 'selectMenuType',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
