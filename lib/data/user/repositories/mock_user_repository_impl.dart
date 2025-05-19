import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../domain/user/entities/user_entity.dart';
import '../../../../domain/user/entities/user_update_data.dart';
import '../../../../domain/user/repositories/user_repository.dart';

// Временная mock-реализация UserRepository
class MockUserRepositoryImpl implements UserRepository {
  UserEntity? _currentUser;

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    print('MockUserRepositoryImpl: getCurrentUser called');
    await Future.delayed(const Duration(milliseconds: 150));
    if (_currentUser != null) {
      return Right(_currentUser!);
    }
    // Имитируем, что пользователь не найден или токен невалиден для первого раза
    // Чтобы AuthStatusCubit перешел в Unauthenticated и показал LoginPage
    // Для теста Authenticated состояния, можно здесь сразу возвращать пользователя:
    // _currentUser = UserEntity(id: 1, email: 'mockuser@example.com', name: 'Mock User');
    // return Right(_currentUser!);
    return Left(ServerFailure('Mock: User not found or token invalid'));
  }

  @override
  Future<Either<Failure, UserEntity>> updateCurrentUser(UserUpdateData userUpdateData) async {
    print('MockUserRepositoryImpl: updateCurrentUser called');
    if (_currentUser == null) {
      return Left(ServerFailure('Mock: No current user to update'));
    }
    _currentUser = UserEntity(
      id: _currentUser!.id,
      email: userUpdateData.email ?? _currentUser!.email,
      name: userUpdateData.name ?? _currentUser!.name,
      isActive: userUpdateData.isActive ?? _currentUser!.isActive,
      isSuperuser: userUpdateData.isSuperuser ?? _currentUser!.isSuperuser,
      isVerified: userUpdateData.isVerified ?? _currentUser!.isVerified,
      gender: userUpdateData.gender ?? _currentUser!.gender,
      birthday: userUpdateData.birthday ?? _currentUser!.birthday,
      avatarUrl: userUpdateData.avatarUrl ?? _currentUser!.avatarUrl,
    );
    return Right(_currentUser!);
  }

  // Вспомогательный метод для тестов или для LoginCubit, чтобы установить текущего пользователя
  void setMockUser(UserEntity? user) {
    _currentUser = user;
  }
} 