import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listed_food/presentation/pages/home.dart';
import '../../auth/cubit/auth_status/auth_status_cubit.dart';
import '../../auth/pages/login_page.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  void initState() {
    super.initState();
    // Запускаем проверку статуса аутентификации при инициализации AuthWrapper
    // Это гарантирует, что проверка происходит после того, как BlocProvider доступен
    // и сам AuthStatusCubit был правильно инициализирован (например, из GetIt)
    context.read<AuthStatusCubit>().checkAuthStatus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthStatusCubit, AuthStatusState>(
      // Используем BlocBuilder вместо BlocConsumer, если listener не нужен здесь напрямую
      // Логика навигации теперь полностью определяется тем, какой виджет возвращает builder
      builder: (context, state) {
        if (state is AuthInitial) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is Authenticated) {
          // Пользователь аутентифицирован, показываем Home
          // Использование Navigator здесь гарантирует, что Home получает свой собственный контекст навигации,
          // что полезно для внутренних переходов в Home и корректной работы Scaffold (например, Drawer).
          return const Home(); // Прямое использование Home, если он не требует Navigator для своей работы
                               // или если вы хотите, чтобы он был частью основного стека навигации MaterialApp
          // Альтернатива с вложенным Navigator, если Home имеет свою сложную навигацию:
          // return Navigator(
          //   onGenerateRoute: (settings) {
          //     if (settings.name == '/' || settings.name == Home.routeName) { // Предполагая Home.routeName
          //       return MaterialPageRoute(builder: (_) => const Home());
          //     }
          //     // Можно добавить другие маршруты для секции Home здесь
          //     return null; // Обработка неизвестных маршрутов внутри этой секции
          //   },
          // );
        }
        // Пользователь не аутентифицирован (Unauthenticated или любая другая ситуация после AuthInitial)
        return const LoginPage();
      },
    );
  }
} 