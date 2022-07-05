import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../common/widgets/button.dart';
import '../../../../common/widgets/dialogs/progress_indicator.dart';
import '../../../../constants/const_widgets.dart';
import '../viewmodel/auth_view_model.dart';
import '../viewmodel/signup_view_model.dart';
import '../widgets/body.dart';
import '../../../../utils/validators/validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  late SignupViewModel signupModelView;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    signupModelView = Provider.of<SignupViewModel>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    void _onLoading() async {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return const ProgressIndicatorDialog();
          });
      bool result = await context.read<AuthViewModel>().logIn();
      if (result) {
        GoRouter.of(context).go('/');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
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
                  ConstWidgets.mSpacer,
                  Image.asset(
                    'assets/images/logo_1000.png',
                    width: 100,
                    height: 100,
                  ),
                  const Spacer(),
                  _emailField(context),
                  const SizedBox(
                    height: 20,
                  ),
                  _passwordField(context),
                  const SizedBox(
                    height: 20,
                  ),
                  _confirmPasswordField(context),
                  Container(
                    width: double.infinity,
                    child: Button(
                        buttonText: "Sign Up",
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          _onLoading();
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
        onChanged: (value) {
          signupModelView.setEmail(value);
        },
        decoration: const InputDecoration(
          icon: Icon(Icons.email),
          border: UnderlineInputBorder(),
          labelText: "Enter your email",
        ),
        validator: (value) {
          return Validators.validEmail(value!);
        });
  }

  Widget _passwordField(BuildContext context) {
    return TextFormField(
      obscureText: true,
      onChanged: (value) {
        signupModelView.setPassword(value);
      },
      decoration: const InputDecoration(
        icon: Icon(Icons.password),
        border: UnderlineInputBorder(),
        labelText: "Enter your password",
      ),
      validator: (value) {
        return Validators.validPassword(value!);
      },
    );
  }

  Widget _confirmPasswordField(BuildContext context) {
    return TextFormField(
      obscureText: true,
      onChanged: (value) {
        signupModelView.setConfirmPassword(value);
      },
      decoration: const InputDecoration(
        icon: Icon(Icons.password),
        border: UnderlineInputBorder(),
        labelText: "Re-enter your password",
      ),
      validator: (value) {
        return Validators.validConfirmPassword(value!, signupModelView.password);
      },
    );
  }
}
