import 'package:get_it/get_it.dart';
import 'package:listed_food/data/auth/repositories/mock_auth_repository_impl.dart';
import 'package:listed_food/data/user/repositories/mock_user_repository_impl.dart';
import 'package:listed_food/domain/auth/repositories/auth_repository.dart';
import 'package:listed_food/domain/user/repositories/user_repository.dart';
import 'package:listed_food/domain/auth/usecases/logout_usecase.dart';
import 'package:listed_food/domain/user/usecases/get_current_user_usecase.dart';
import 'package:listed_food/presentation/auth/cubit/auth_status/auth_status_cubit.dart';
import 'package:listed_food/domain/auth/usecases/login_usecase.dart';
import 'package:listed_food/presentation/auth/cubit/login/login_cubit.dart';

// Экземпляр GetIt для доступа к зависимостям
final sl = GetIt.instance;

Future<void> initDi() async {
  // ========== Blocs / Cubits ==========
  // AuthStatusCubit лучше создавать в main и передавать через BlocProvider,
  // так как он часто нужен очень рано и глобально. 
  // Но если он нужен как зависимость другим сервисам, его можно зарегистрировать.
  // Здесь мы зарегистрируем его фабрику, чтобы main мог его создать.
  sl.registerFactory(
    () => AuthStatusCubit(
      getCurrentUserUseCase: sl(), // GetIt будет внедрять зависимости
      logoutUseCase: sl(),
    ),
  );

  // ========== Use Cases ==========
  sl.registerLazySingleton(() => GetCurrentUserUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  // Регистрируем LoginUseCase
  sl.registerLazySingleton(() => LoginUseCase(sl()));

  // Регистрируем фабрику для LoginCubit
  sl.registerFactory(
    () => LoginCubit(
      loginUseCase: sl(),
      getCurrentUserUseCase: sl(),
      authStatusCubit: sl(), // AuthStatusCubit уже зарегистрирован как factory
    ),
  );
  // Другие use cases будут добавляться сюда по мере необходимости (RegisterUseCase и т.д.)

  // ========== Repositories ==========
  // Регистрируем Mock-реализации. Позже заменим на настоящие.
  sl.registerLazySingleton<AuthRepository>(() => MockAuthRepositoryImpl());
  sl.registerLazySingleton<UserRepository>(() => MockUserRepositoryImpl());

  // ========== Data Sources ==========
  // Пока нет, но здесь будут регистрироваться RemoteDataSource, LocalDataSource

  // ========== Core / External ==========
  // Например, SharedPreferences, Dio (HttpClient) и т.д.
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => Dio());
} 