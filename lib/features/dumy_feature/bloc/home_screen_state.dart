import 'package:equatable/equatable.dart';
import '../models/response/user_list_response.dart';

enum HomeScreenStatus { initial, loading, completed, error }

class HomeScreenState extends Equatable {
  final UserList? userList;
  final HomeScreenStatus status;

  const HomeScreenState({
    required this.userList,
    required this.status,
  });

  factory HomeScreenState.initial() {
    return const HomeScreenState(
      userList: null,
      status: HomeScreenStatus.initial,
    );
  }

  HomeScreenState copyWith({
    UserList? userList,
    HomeScreenStatus? status,
  }) {
    return HomeScreenState(
      userList: userList ?? this.userList,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        userList ?? Object(),
        status,
      ];
}
