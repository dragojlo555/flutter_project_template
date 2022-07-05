import '../../../../base/model_view_base.dart';
import '../../../../utils/services/local_storage/shared_preferences_helper.dart';

enum AuthCubitStatus { unknown, authenticated, unauthenticated }

AuthCubitStatus _authCubitStatus = AuthCubitStatus.unknown;

class AuthViewModel extends ModelViewBase {
  AuthViewModel(String? token) {
    if (token != null && token.isNotEmpty) {
      _authCubitStatus = AuthCubitStatus.authenticated;
    }
  }

  AuthCubitStatus get authCubitStatus => _authCubitStatus;

  setAuthCubitStatus(AuthCubitStatus status) {
    _authCubitStatus = status;
    notifyListeners();
  }

  void logOut() {
    setAuthCubitStatus(AuthCubitStatus.unauthenticated);
    SharedPreferencesHelper.clearToken();
  }

  Future<bool> logIn() async {
    await Future.delayed(const Duration(seconds: 1));
    setAuthCubitStatus(AuthCubitStatus.authenticated);
    SharedPreferencesHelper.setToken('dummytoken');
    return true;
  }
}
