import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../../../core/usecase/usecase.dart';
import '../../user/entities/user_creation_data.dart';
import '../../user/entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase implements UseCase<UserEntity, UserCreationData> {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(UserCreationData params) async {
    return await repository.register(params);
  }
} 