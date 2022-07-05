import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/response/user_list_response.dart';
import '../repo/dummy_feature_repo.dart';

import 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenState.initial());
  final DummyFeatureRepo dummyRepository = DummyFeatureRepo();

  Future fetchUsers() async {
    try {
      UserList users = await dummyRepository.getUserList();
      emit(state.copyWith(userList: users, status: HomeScreenStatus.completed));
    } catch (ex) {
      print('HANDLING ERROR: ' + ex.toString());
      //OVDE IZHENDLATI ERROR I PRIKAZATI KORISNIKU ODGOVARAJUCU PORUKU TAKO STO CE SE SETOVATI FAILURE U STATE-U
    }
  }
}
