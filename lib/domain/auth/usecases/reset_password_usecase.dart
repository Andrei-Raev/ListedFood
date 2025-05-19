import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/errors/failure.dart';
import '../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class ResetPasswordParams extends Equatable {
  final String token;
  final String password;

  const ResetPasswordParams({required this.token, required this.password});

  @override
  List<Object?> get props => [token, password];
}

class ResetPasswordUseCase implements UseCase<void, ResetPasswordParams> {
  final AuthRepository repository;

  ResetPasswordUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(ResetPasswordParams params) async {
    return await repository.resetPassword(params.token, params.password);
  }
} 