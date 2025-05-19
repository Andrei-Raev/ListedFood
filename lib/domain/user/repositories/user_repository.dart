import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../entities/user_entity.dart';
import '../entities/user_update_data.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getCurrentUser();
  Future<Either<Failure, UserEntity>> updateCurrentUser(UserUpdateData userUpdateData);
  // Другие методы, если понадобятся, например:
  // Future<Either<Failure, UserEntity>> getUserById(String id);
  // Future<Either<Failure, void>> deleteUser(String id);
} 