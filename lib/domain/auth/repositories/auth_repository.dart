import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../entities/auth_credentials.dart';
import '../entities/token_details.dart';
import '../../user/entities/user_entity.dart';
import '../../user/entities/user_creation_data.dart';

abstract class AuthRepository {
  Future<Either<Failure, TokenDetails>> login(AuthCredentials credentials);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, UserEntity>> register(UserCreationData userCreationData);
  Future<Either<Failure, void>> requestPasswordReset(String email);
  Future<Either<Failure, void>> resetPassword(String token, String password);
} 