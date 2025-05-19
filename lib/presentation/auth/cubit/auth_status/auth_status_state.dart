part of 'auth_status_cubit.dart';

abstract class AuthStatusState extends Equatable {
  const AuthStatusState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthStatusState {}

class Authenticated extends AuthStatusState {
  final UserEntity user;

  const Authenticated(this.user);

  @override
  List<Object> get props => [user];
}

class Unauthenticated extends AuthStatusState {} 