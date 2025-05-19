import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:listed_food/core/errors/failure.dart';

// import 'package:dartz/dartz.dart'; // dartz уже должен быть импортирован в usecase.dart
import 'package:listed_food/domain/auth/usecases/logout_usecase.dart';
import 'package:listed_food/domain/user/entities/user_entity.dart';
import 'package:listed_food/domain/user/usecases/get_current_user_usecase.dart';
import '../../../../core/usecase/usecase.dart'; // <--- ПРАВИЛЬНЫЙ ИМПОРТ ДЛЯ NoParams и UseCase

part 'auth_status_state.dart';

// Удаляем дублирующие определения UseCase и NoParams отсюда
// abstract class UseCase<Type, Params> { ... }
// class NoParams extends Equatable { ... }

class AuthStatusCubit extends Cubit<AuthStatusState> {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final LogoutUseCase _logoutUseCase;

  // Предполагается, что есть некий сервис для хранения токена,
  // его доступность будет проверена здесь.
  // final TokenStorageService _tokenStorageService;

  AuthStatusCubit({
    required GetCurrentUserUseCase getCurrentUserUseCase,
    required LogoutUseCase logoutUseCase,
    // required TokenStorageService tokenStorageService,
  }) : _getCurrentUserUseCase = getCurrentUserUseCase,
       _logoutUseCase = logoutUseCase,
       // _tokenStorageService = tokenStorageService,
       super(AuthInitial());

  Future<void> checkAuthStatus() async {
    emit(AuthInitial());
    await Future.delayed(const Duration(milliseconds: 800));
    print(
      "AuthStatusCubit: Checking auth status - emitting Unauthenticated (placeholder)",
    );
    // В реальном приложении здесь будет логика с _getCurrentUserUseCase(NoParams())
    // final userEither = await _getCurrentUserUseCase(NoParams());
    // userEither.fold(
    //   (failure) => emit(Unauthenticated()),
    //   (user) => emit(Authenticated(user)),
    // );
    emit(Unauthenticated()); // Пока оставляем так для демонстрации
  }

  Future<void> loggedIn(UserEntity user) async {
    // Этот метод будет вызван из LoginCubit после успешного входа
    // Здесь можно сохранить токен, если это не сделано в AuthRepositoryImpl
    // await _tokenStorageService.saveToken(user.token); // Пример, если токен часть UserEntity
    emit(Authenticated(user));
  }

  Future<void> loggedOut() async {
    final result = await _logoutUseCase(NoParams()); // Теперь NoParams будет из core/usecase
    result.fold(
      (failure) {
        // Обработка ошибки выхода (например, показать снэкбар)
        // В любом случае, считаем пользователя вышедшим
        print("AuthStatusCubit: Logout failed - ${failure.message}");
        emit(Unauthenticated());
      },
      (_) => emit(Unauthenticated()),
    );
    // Здесь нужно будет очистить локально сохраненный токен
    // await _tokenStorageService.clearToken();
    print("AuthStatusCubit: User logged out - emitting Unauthenticated");
  }
}

// Абстрактный класс для всех Use Case'ов
// Type - это тип возвращаемого значения при успехе
// Params - это тип параметров, которые принимает use case
