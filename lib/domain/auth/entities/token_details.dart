import 'package:equatable/equatable.dart';

class TokenDetails extends Equatable {
  final String accessToken;
  final String tokenType;

  const TokenDetails({
    required this.accessToken,
    required this.tokenType,
  });

  @override
  List<Object?> get props => [accessToken, tokenType];
} 