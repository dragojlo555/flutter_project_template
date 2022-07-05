import '../../../../base/model_view_base.dart';

class SignupViewModel extends ModelViewBase {
  String _confirmPassword = '';
  String _email = '';
  String _password = '';

  String get confirmPassword => _confirmPassword;

  String get password => _password;

  String get email => _email;

  setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  setConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    notifyListeners();
  }
}
