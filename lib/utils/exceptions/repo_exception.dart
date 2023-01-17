import '../../models/core/failure_model.dart';

class RepoException implements Exception {
  final String message;
  final Failure failure;

  RepoException({required this.message, required this.failure});

  @override
  String toString() {
    return "$message failure: $failure";
  }
}
