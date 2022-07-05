import 'package:flutter/material.dart';
import '../../../../features/core/auth/viewmodel/signup_view_model.dart';
import '../../../../features/core/auth/views/sign_up_screen.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignupViewModel(),
      child: const SignUpScreen(),
    );
  }
}
