import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/auth/viewmodel/auth_view_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.red,
      body: Column(
        children: [
          const Center(
            child: Text('Ovo je Detail Screen'),
          ),
          ElevatedButton(
              onPressed: () {
                context.read<AuthViewModel>().logOut();
                context.go('/login');
              },
              child: const Text('Back to home')),
          ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('BACK'),
          ),
        ],
      ),
    );
  }
}
