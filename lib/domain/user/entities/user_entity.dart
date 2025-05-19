import 'package:equatable/equatable.dart';
import './gender.dart';

class UserEntity extends Equatable {
  final int id;
  final String email;
  final bool isActive;
  final bool isSuperuser;
  final bool isVerified;
  final String? name;
  final Gender? gender;
  final DateTime? birthday;
  final String? avatarUrl;

  const UserEntity({
    required this.id,
    required this.email,
    this.isActive = true,
    this.isSuperuser = false,
    this.isVerified = false,
    this.name,
    this.gender,
    this.birthday,
    this.avatarUrl,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        isActive,
        isSuperuser,
        isVerified,
        name,
        gender,
        birthday,
        avatarUrl,
      ];
} 