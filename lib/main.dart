import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:listed_food/presentation/pages/home.dart';
import 'package:listed_food/presentation/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/utils/utils.dart';
import 'generated/l10n.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// Импорты для DI и вынесенных компонентов
import 'di/injection_container.dart' as di; // di prefix for clarity
import 'presentation/core/widgets/auth_wrapper.dart';
import 'presentation/auth/cubit/auth_status/auth_status_cubit.dart';

// Удаляем Domain/Core imports, если они больше не нужны напрямую в main.dart
// (AuthCredentials, TokenDetails, etc. - они теперь инкапсулированы)
// import 'core/errors/failure.dart';
// import 'core/usecase/usecase.dart';
// import 'domain/user/entities/user_entity.dart';
// import 'domain/auth/repositories/auth_repository.dart';
// import 'domain/user/repositories/user_repository.dart';
// import 'domain/auth/usecases/logout_usecase.dart';
// import 'domain/user/usecases/get_current_user_usecase.dart';
// import 'presentation/auth/pages/login_page.dart'; // LoginPage используется в AuthWrapper

// Глобальная переменная authStatusCubitInstance больше не нужна
// late AuthStatusCubit authStatusCubitInstance;

void main() async { // main теперь async из-за initDi
  // Гарантируем инициализацию Flutter биндингов
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализируем наш Service Locator
  await di.initDi();

  // Создаем AuthStatusCubit с помощью Service Locator
  final authStatusCubit = di.sl<AuthStatusCubit>();

  // Регистрируем созданный экземпляр AuthStatusCubit в GetIt, чтобы
  // другие зависимости (например, LoginCubit) могли его получить.
  // Это нужно, если AuthStatusCubit создается вне DI и используется глобально.
  if (!di.sl.isRegistered<AuthStatusCubit>()) {
    di.sl.registerSingleton<AuthStatusCubit>(authStatusCubit);
  }

  runApp(MyApp(authStatusCubit: authStatusCubit));
}

class MyApp extends StatefulWidget {
  final AuthStatusCubit authStatusCubit; // Принимаем AuthStatusCubit
  const MyApp({super.key, required this.authStatusCubit});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode? _themeMode;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefsInstance) {
      prefs = prefsInstance;
      setState(() {
        _locale = Locale(prefs.getString('language') ?? 'ru');
        _themeMode = themeFromString(prefs.getString('theme') ?? ThemeMode.system.name);
      });
    });
  }

  void setLocale(Locale newLocale) {
     prefs.setString('language', newLocale.languageCode);
    setState(() {
      _locale = newLocale;
    });
  }

  void setThemeMode(ThemeMode newThemeMode) {
    debugPrint("Setting theme to: ${newThemeMode.name}");
    prefs.setString('theme', newThemeMode.name);
    setState(() {
      _themeMode = newThemeMode;
    });
  }

  Locale? get locale => _locale;
  ThemeMode? get themeMode => _themeMode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.authStatusCubit, // Используем authStatusCubit из StatefulWidget
      child: MaterialApp(
        title: 'ListedFood App',
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
        supportedLocales: S.delegate.supportedLocales,
        localeResolutionCallback: (locale, supportedLocales) {
          if (locale == null) {
            return supportedLocales.first;
          }
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        home: const AuthWrapper(), // AuthWrapper теперь импортируется
        routes: {
          // Home.routeName: (context) => const Home(), // Убрали, т.к. у Home нет routeName
                                                    // и AuthWrapper управляет показом Home
        },
      ),
    );
  }
}

// Mock-классы и AuthWrapper теперь удалены из этого файла.
// Они находятся в:
// lib/data/auth/repositories/mock_auth_repository_impl.dart
// lib/data/user/repositories/mock_user_repository_impl.dart
// lib/presentation/core/widgets/auth_wrapper.dart
