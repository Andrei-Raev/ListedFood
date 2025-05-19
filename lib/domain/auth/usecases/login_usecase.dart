import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../../../core/usecase/usecase.dart';
import '../entities/auth_credentials.dart';
import '../entities/token_details.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase implements UseCase<TokenDetails, AuthCredentials> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, TokenDetails>> call(AuthCredentials params) async {
    return await repository.login(params);
  }
} 