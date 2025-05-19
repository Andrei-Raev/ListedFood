import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../errors/failure.dart'; // Убедимся, что Failure импортирован правильно

// Абстрактный класс для всех Use Case'ов
// Type - это тип возвращаемого значения при успехе
// Params - это тип параметров, которые принимает use case
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// Вспомогательный класс для use case'ов, которые не принимают параметров
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
} 