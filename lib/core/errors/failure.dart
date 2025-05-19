import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  // Можно добавить дополнительные поля, если нужно, например, код ошибки
  // final int? statusCode;

  const Failure(this.message /*, {this.statusCode}*/);

  @override
  List<Object?> get props => [message /*, statusCode*/];

  @override
  String toString() => message;
}

// Общие типы ошибок

// Ошибка сервера (например, 500, 400, 401, 403, 404 от API)
class ServerFailure extends Failure {
  const ServerFailure(super.message /*, {super.statusCode}*/);
}

// Ошибка сети (например, нет подключения к интернету)
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

// Ошибка кэша (например, не удалось прочитать/записать данные в локальное хранилище)
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

// Ошибка парсинга данных (например, неверный формат JSON)
class ParsingFailure extends Failure {
  const ParsingFailure(super.message);
}

// Неизвестная или неожиданная ошибка
class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message);
}

// Ошибка, связанная с локальным хранилищем (например, secure storage)
class LocalStorageFailure extends Failure {
  const LocalStorageFailure(super.message);
}

// Можно добавлять другие специфичные типы ошибок по мере необходимости
// например, TimeoutFailure, AuthenticationFailure (если отличается от ServerFailure с кодом 401) 