import 'package:equatable/equatable.dart';
import './gender.dart';

class UserCreationData extends Equatable {
  final String email;
  final String password;
  final String? name;
  final Gender? gender;
  final DateTime? birthday;
  final String? avatarUrl;

  const UserCreationData({
    required this.email,
    required this.password,
    this.name,
    this.gender,
    this.birthday,
    this.avatarUrl,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        name,
        gender,
        birthday,
        avatarUrl,
      ];
} 