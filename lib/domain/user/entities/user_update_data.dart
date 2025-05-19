import 'package:equatable/equatable.dart';
import './gender.dart';

class UserUpdateData extends Equatable {
  final String? email;
  final String? password;
  final bool? isActive;
  final bool? isSuperuser;
  final bool? isVerified;
  final String? name;
  final Gender? gender;
  final DateTime? birthday;
  final String? avatarUrl;

  const UserUpdateData({
    this.email,
    this.password,
    this.isActive,
    this.isSuperuser,
    this.isVerified,
    this.name,
    this.gender,
    this.birthday,
    this.avatarUrl,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        isActive,
        isSuperuser,
        isVerified,
        name,
        gender,
        birthday,
        avatarUrl,
      ];
} 