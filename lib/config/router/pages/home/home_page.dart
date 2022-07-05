import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../features/core/auth/viewmodel/signup_view_model.dart';
import '../../../../features/dumy_feature/viewmodel/home_screen_cubit.dart';
import '../../../../features/dumy_feature/views/home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignupViewModel(),
      child: BlocProvider<HomeScreenCubit>(
        create: (context) => HomeScreenCubit(),
        child: const HomeScreen(),
      ),
    );
  }
}
