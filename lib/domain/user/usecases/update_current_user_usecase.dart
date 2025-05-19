import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../../../core/usecase/usecase.dart';
import '../entities/user_entity.dart';
import '../entities/user_update_data.dart';
import '../repositories/user_repository.dart';

class UpdateCurrentUserUseCase implements UseCase<UserEntity, UserUpdateData> {
  final UserRepository repository;

  UpdateCurrentUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(UserUpdateData params) async {
    return await repository.updateCurrentUser(params);
  }
} 