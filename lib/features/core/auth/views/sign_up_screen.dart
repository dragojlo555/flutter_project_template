import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../common/widgets/button.dart';
import '../../../../common/widgets/dialogs/progress_indicator.dart';
import '../../../../config/router/router_paths.dart';
import '../../../../constants/assets_path.dart';
import '../../../../constants/const_widgets.dart';
import '../bloc/auth_cubit.dart';
import '../widgets/body.dart';
import '../../../../utils/validators/validators.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final emailTEC = TextEditingController();
  final passwordTEC = TextEditingController();
  final confirmPasswordTEC = TextEditingController();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onLoading() async {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return const ProgressIndicatorDialog();
          });
      bool result = await context.read<AuthCubit>().logIn();
      if (result) {
        GoRouter.of(context).go(RouterPaths.home);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).signup),
      ),
      body: Body(
        child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              margin: const EdgeInsets.only(bottom: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Image.asset(
                    AppAssets.logoHeadline,
                    width: 200,
                    height: 200,
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  _emailField(context),
                  const SizedBox(
                    height: 20,
                  ),
                  _passwordField(context),
                  const SizedBox(
                    height: 20,
                  ),
                  _confirmPasswordField(context),
                  ConstWidgets.lSpacer,
                  SizedBox(
                    width: double.infinity,
                    child: Button(
                        buttonText:  AppLocalizations.of(context).signup,
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          onLoading();
                        }),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextFormField(
        controller: emailTEC,
        decoration: InputDecoration(
          icon:const Icon(Icons.email),
          border:const UnderlineInputBorder(),
          labelText:  AppLocalizations.of(context).enter_email,
        ),
        validator: (value) {
          return Validators.validEmail(value!);
        });
  }

  Widget _passwordField(BuildContext context) {
    return TextFormField(
      controller: passwordTEC,
      obscureText: true,
      decoration: InputDecoration(
        icon:const Icon(Icons.password),
        border:const UnderlineInputBorder(),
        labelText:  AppLocalizations.of(context).enter_password,
      ),
      validator: (value) {
        return Validators.validPassword(value!);
      },
    );
  }

  Widget _confirmPasswordField(BuildContext context) {
    return TextFormField(
      controller: confirmPasswordTEC,
      obscureText: true,
      decoration:  InputDecoration(
        icon:const Icon(Icons.password),
        border:const UnderlineInputBorder(),
        labelText:  AppLocalizations.of(context).reenter_password,
      ),
      validator: (value) {
        return Validators.validConfirmPassword(value!, passwordTEC.text);
      },
    );
  }
}
