import 'package:flutter/material.dart';
import '../../../../features/dumy_feature/views/detail_screen.dart';

class DetailPage extends StatelessWidget {
  final String idUser;
  const DetailPage({Key? key, required this.idUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int id = int.parse(idUser);
    return DetailScreen(
      idUser: id,
    );
  }
}
