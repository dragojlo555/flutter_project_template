import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/widgets/button.dart';
import '../../../../common/widgets/dialogs/progress_indicator.dart';
import '../../../../constants/const_widgets.dart';
import '../../../../utils/validators/validators.dart';
import '../bloc/auth_view_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
        appBar: AppBar(
          title: const Text('Log In'),
        ),
        body: CustomScrollView(
          //Instead of ListView or SingleChildScrollView put CustomScrollVIew to use Expanded or spacer
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Image.asset(
                    'assets/images/logo_1000.png',
                    width: 200,
                    height: 200,
                  ),
                  const Spacer(
                    flex: 3,
                  ),
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
                          ConstWidgets.lSpacer,
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
        ));
  }
}

Widget _emailField(BuildContext context) {
  return TextFormField(
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
