import 'package:flutter/cupertino.dart';
import '../models/core/failure_model.dart';

class ModelViewBase extends ChangeNotifier {
  bool _isLoading = false;
  Failure? _failure;

  bool get isLoading => _isLoading;
  Failure? get failure => _failure;

  setFailure(Failure failure) {
    _failure = _failure;
    notifyListeners();
  }

  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
