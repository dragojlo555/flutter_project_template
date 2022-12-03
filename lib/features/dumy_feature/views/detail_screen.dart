import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/auth/bloc/auth_view_model.dart';
import '../bloc/home_screen_cubit.dart';
import '../bloc/home_screen_state.dart';

class DetailScreen extends StatelessWidget {
  final int idUser;
  const DetailScreen({Key? key, required this.idUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Center(
            child: Text('This is Detail Screen'),
          ),
          ElevatedButton(
              onPressed: () {
                context.read<AuthViewModel>().logOut();
                context.go('/login');
              },
              child: const Text('Back to home')),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            child: const Text('BACK'),
          ),
          SizedBox(
            height: 100,
            child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Card(
                  child: Column(
                    children: [
                      Text(state.userList?.entries[idUser].name ?? ''),
                      Text(state.userList?.entries[idUser].username ?? ''),
                      Text(state.userList?.entries[idUser].email ?? ''),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
