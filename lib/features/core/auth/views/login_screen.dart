import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/widgets/button.dart';
import '../../../../common/widgets/dialogs/progress_indicator.dart';
import '../../../../constants/const_widgets.dart';
import '../viewmodel/auth_view_model.dart';
import '../viewmodel/login_view_model.dart';
import '../widgets/body.dart';
import '../../../../utils/validators/validators.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    void _login() async {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const ProgressIndicatorDialog();
        },
      );
      bool result = await context.read<AuthViewModel>().logIn();
      if (result) {
        GoRouter.of(context).go('/');
      }
    }

    return Scaffold(
      body: CustomScrollView(
        //Instead of ListView or SingleChildScrollView put CustomScrollVIew to use Expanded or spacer
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ConstWidgets.mSpacer,
                Image.asset(
                  'assets/images/logo_1000.png',
                  width: 100,
                  height: 100,
                ),
                const Spacer(),
                Form(
                  key: _formKey,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context).welcomeTitle,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        _emailField(context),
                        ConstWidgets.mSpacer,
                        _passwordField(context),
                        SizedBox(
                          width: double.infinity,
                          child: Button(
                              buttonText: AppLocalizations.of(context).login,
                              onPressed: () {
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }
                                _login();
                              }),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Button(
                            buttonText: "Sign Up",
                            onPressed: () {
                              context.go('/login/registration');
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _emailField(BuildContext context) {
  return TextFormField(
    onChanged: (value) {
      context.read<LoginViewModel>().setEmail(value);
    },
    decoration: const InputDecoration(
      prefixIcon: Icon(Icons.email),
      border: UnderlineInputBorder(),
      labelText: "Enter your email",
    ),
    validator: (value) {
      return Validators.validEmail(value!);
    },
  );
}

Widget _passwordField(BuildContext context) {
  return TextFormField(
    onChanged: (value) {
      context.read<LoginViewModel>().setPassword(value);
    },
    obscureText: true,
    decoration: const InputDecoration(
      prefixIcon: Icon(Icons.password),
      border: UnderlineInputBorder(),
      labelText: "Enter your password",
    ),
    validator: (value) {
      return Validators.validPassword(value!);
    },
  );
}
