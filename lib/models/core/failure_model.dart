import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final int code;
  final String message;
  final String key;

  const Failure({required this.code, this.message = '', required this.key});

  static unhandled() {
    return const Failure(
        key: 'UNHANDLED_ERROR', code: 999, message: 'Unhandled error');
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [code, message, key];
}
