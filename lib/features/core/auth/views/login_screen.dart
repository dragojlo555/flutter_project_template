import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../common/widgets/button.dart';
import '../../../../common/widgets/dialogs/progress_indicator.dart';
import '../../../../config/router/router_paths.dart';
import '../../../../constants/assets_path.dart';
import '../../../../constants/const_widgets.dart';
import '../../../../l10n/locales.dart';
import '../../../../utils/validators/validators.dart';
import '../../settings/bloc/settings_cubit.dart';
import '../bloc/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  void login(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const ProgressIndicatorDialog();
      },
    );
    bool result = await context.read<AuthCubit>().logIn();
    if (result) {
      GoRouter.of(context).go(RouterPaths.home);//Waiting on new version flutter where we have mounted property in Stateless component
    }
  }

  @override
  Widget build(BuildContext context) {
    void changeLanguage(Locale locale) {
      context.read<SettingsCubit>().setLanguageCode(locale.languageCode);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).login),
          actions: <Widget>[
            PopupMenuButton<Locale>(
              icon: const Icon(Icons.language),
              onSelected: changeLanguage,
              itemBuilder: (BuildContext context) {
                return (AppLocale.myLocales.map((e) {
                  return PopupMenuItem<Locale>(
                    value: Locale(e.locale),
                    child: Text(e.language),
                  );
                }).toList());
              },
            )
          ],
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
                    AppAssets.logoHeadline,
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
                                  login(context);
                                }),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Button(
                              buttonText: AppLocalizations.of(context).signup,
                              onPressed: () {
                                context.push(RouterPaths.registration);
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
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.email),
      border: const UnderlineInputBorder(),
      labelText: AppLocalizations.of(context).enter_email,
    ),
    validator: (value) {
      return Validators.validEmail(value!);
    },
  );
}

Widget _passwordField(BuildContext context) {
  return TextFormField(
    obscureText: true,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.password),
      border: const UnderlineInputBorder(),
      labelText: AppLocalizations.of(context).enter_password,
    ),
    validator: (value) {
      return Validators.validPassword(value!);
    },
  );
}
