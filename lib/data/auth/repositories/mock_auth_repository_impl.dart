import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../domain/auth/entities/auth_credentials.dart';
import '../../../../domain/auth/entities/token_details.dart';
import '../../../../domain/user/entities/user_creation_data.dart';
import '../../../../domain/user/entities/user_entity.dart';
import '../../../../domain/auth/repositories/auth_repository.dart';

// Временная mock-реализация AuthRepository
class MockAuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, TokenDetails>> login(AuthCredentials credentials) async {
    print('MockAuthRepositoryImpl: login called with ${credentials.email}');
    await Future.delayed(const Duration(seconds: 1));
    if (credentials.email == "test@test.com" && credentials.password == "password") {
      return Right(TokenDetails(accessToken: 'mock_token_${DateTime.now().millisecondsSinceEpoch}', tokenType: 'bearer'));
    }
    return Left(ServerFailure('Mock: Invalid credentials'));
  }

  @override
  Future<Either<Failure, void>> logout() async {
    print('MockAuthRepositoryImpl: logout called');
    return const Right(null);
  }

  @override
  Future<Either<Failure, UserEntity>> register(UserCreationData userCreationData) async {
    print('MockAuthRepositoryImpl: register called for ${userCreationData.email}');
    await Future.delayed(const Duration(seconds: 1));
    return Right(UserEntity(
      id: DateTime.now().millisecondsSinceEpoch % 1000, // Простое уникальное ID для мока
      email: userCreationData.email,
      name: userCreationData.name ?? "Registered User",
      // isActive, isSuperuser, isVerified будут иметь значения по умолчанию из UserEntity
    ));
  }

  @override
  Future<Either<Failure, void>> requestPasswordReset(String email) async {
    print('MockAuthRepositoryImpl: requestPasswordReset for $email');
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> resetPassword(String token, String password) async {
    print('MockAuthRepositoryImpl: resetPassword with token $token');
    return const Right(null);
  }
} 