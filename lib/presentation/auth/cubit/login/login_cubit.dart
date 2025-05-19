import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../domain/auth/entities/auth_credentials.dart';
import '../../../../domain/user/entities/user_entity.dart';
import '../../../../domain/auth/usecases/login_usecase.dart';
import '../../../../domain/user/usecases/get_current_user_usecase.dart';
import '../auth_status/auth_status_cubit.dart';
import '../../../../core/usecase/usecase.dart';

// Импортируем MockUserRepositoryImpl для setMockUser
import '../../../../data/user/repositories/mock_user_repository_impl.dart';
import '../../../../di/injection_container.dart'; // Для доступа к sl

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final AuthStatusCubit _authStatusCubit; // Для обновления глобального состояния

  LoginCubit({
    required LoginUseCase loginUseCase,
    required GetCurrentUserUseCase getCurrentUserUseCase,
    required AuthStatusCubit authStatusCubit,
  })  : _loginUseCase = loginUseCase,
        _getCurrentUserUseCase = getCurrentUserUseCase,
        _authStatusCubit = authStatusCubit,
        super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    final credentials = AuthCredentials(email: email, password: password);
    final tokenEither = await _loginUseCase(credentials);

    await tokenEither.fold(
      (failure) async {
        emit(LoginFailure(failure.message));
      },
      (tokenDetails) async {
        // Токен получен. Теперь получаем данные пользователя.
        // В реальном приложении этот токен сохранится (например, в AuthRepositoryImpl)
        // и будет использоваться HttpClient-ом для последующих запросов.
        // Для mock-репозитория мы вручную установим пользователя, чтобы getCurrentUser сработал.
        
        // Имитация того, что после логина getCurrentUser должен вернуть пользователя.
        // Это нужно, т.к. getCurrentUser в MockUserRepositoryImpl по умолчанию возвращает Left.
        // В реальном приложении это будет работать через сохраненный токен.
        // Создаем временного UserEntity на основе email, так как это единственное, что у нас есть точно.
        // ID и другие поля будут фиктивными для мока.
        final tempUserForMock = UserEntity(
            id: DateTime.now().millisecondsSinceEpoch,
            email: email,
            name: email.split('@').first, // Простое имя из email для мока
        );
        // Получаем экземпляр MockUserRepositoryImpl из GetIt и устанавливаем пользователя
        // Это ХАК для mock-окружения. В реальном приложении это не понадобится.
        try {
          final userRepository = sl<MockUserRepositoryImpl>();
          userRepository.setMockUser(tempUserForMock);
        } catch (e) {
          print("LoginCubit: Could not set mock user in MockUserRepositoryImpl. Is it registered correctly in GetIt as MockUserRepositoryImpl? Error: $e");
          // Можно продолжить без этого, но getCurrentUser может не сработать как ожидается в моке
        }

        final userEither = await _getCurrentUserUseCase(NoParams());
        userEither.fold(
          (failure) {
            // Если даже после получения токена не удалось получить пользователя
            emit(LoginFailure('Вход успешен, но не удалось получить данные пользователя: ${failure.message}'));
          },
          (user) {
            _authStatusCubit.loggedIn(user); // Уведомляем глобальный AuthStatusCubit
            emit(LoginSuccess(user));
          },
        );
      },
    );
  }
} 