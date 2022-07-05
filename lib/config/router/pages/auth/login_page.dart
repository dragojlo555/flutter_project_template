import 'package:flutter/material.dart';
import '../../../../features/core/auth/viewmodel/login_view_model.dart';
import '../../../../features/core/auth/views/login_screen.dart';

import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: const LoginScreen(),
    );
  }
}
