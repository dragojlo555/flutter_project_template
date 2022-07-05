import '../../../../models/core/user.dart';

class UserList {
  late List<User> _entries = [];
  List<User> get entries => _entries;

  UserList({List<User>? entries}) {
    _entries = entries!;
  }

  UserList.toList(List<dynamic> json) {
    for (var u in json) {
      // print(u);
      User user = User(
        id: u["id"],
        company: u["company"][0],
        email: u["email"],
        name: u["name"],
        phone: u["phone"],
        username: u["username"],
        website: u["website"],
      );
      _entries.add(user);
    }
  }
}
