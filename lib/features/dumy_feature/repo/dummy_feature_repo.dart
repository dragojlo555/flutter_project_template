import 'package:dio/dio.dart';
import '../models/response/user_list_response.dart';
import '../../../utils/services/rest_api/api_helper.dart';

class DummyFeatureRepo {
  ApiBaseHelper api = ApiBaseHelper();

  Future<UserList> getUserList() async {
    Response? response = await ApiBaseHelper()
        .getHTTP('https://jsonplaceholder.typicode.com/users', null);
    UserList userList = UserList.toList(response?.data);
    return userList;
  }
}
