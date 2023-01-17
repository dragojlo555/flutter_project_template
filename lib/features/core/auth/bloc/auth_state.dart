part of 'auth_cubit.dart';

enum AuthCubitStatus { unknown, authenticated, unauthenticated }

class AuthState extends Equatable {
  final AuthCubitStatus authStatus;

  const AuthState({this.authStatus = AuthCubitStatus.unknown});

  @override
  List<Object> get props => [authStatus];

  AuthState copyWith({AuthCubitStatus? authStatus}) {
    return AuthState(authStatus: authStatus ?? this.authStatus);
  }
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}
