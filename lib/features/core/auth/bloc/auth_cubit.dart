import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../utils/services/local_storage/shared_preferences_helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required String? token}) : super(const AuthState()) {
    if (token != null) {
      SharedPreferencesHelper.setToken(token);
      emit(const AuthState(authStatus: AuthCubitStatus.authenticated));
    } else {
      SharedPreferencesHelper.clearToken();
      emit(const AuthState(authStatus: AuthCubitStatus.unauthenticated));
    }
  }

  void logOut() {
    emit(const AuthState(authStatus: AuthCubitStatus.unauthenticated));
    SharedPreferencesHelper.clearToken();
  }

  Future<bool> logIn() async {
    await Future.delayed(const Duration(seconds: 1));
    emit(const AuthState(authStatus: AuthCubitStatus.authenticated));
    SharedPreferencesHelper.setToken('dummytoken');
    return true;
  }
}
