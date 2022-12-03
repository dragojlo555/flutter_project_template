import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './styles/themes.dart';
import 'config/router/router.dart';
import 'features/core/auth/bloc/auth_view_model.dart';
import 'features/core/settings/bloc/settings_view_model.dart';
import 'features/dumy_feature/bloc/home_screen_cubit.dart';
import 'utils/services/local_storage/shared_preferences_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  String? languageCode = await SharedPreferencesHelper.getLanguageCode();
  String? token = await SharedPreferencesHelper.getToken();
  final AuthViewModel authService = AuthViewModel(token);
  final SettingsViewModel settingsViewModel = SettingsViewModel(languageCode);

  runApp(MyApp(
    authService: authService,
    settingsViewModel: settingsViewModel,
  ));
}

class MyApp extends StatelessWidget {
  late final AuthViewModel authService;
  late final SettingsViewModel settingsViewModel;

  late final GoRouter mg_router = GoRouter(
      initialLocation: '/',
      routes: appRoutes,
      redirect: (state) {
        //   print('REGISTRATION STATUSL ' + state.location);
        //   if (state.location == '/' && registrationViewModel.registrationStatus != RegistrationStatus.REGISTER) {
        //     print('OVDEE');
        //     return '/registration';
        //   }
        return null;
      });

  MyApp({Key? key, required this.authService, required this.settingsViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => authService,
          ),
          BlocProvider<HomeScreenCubit>(create: (context) => HomeScreenCubit()),
          ChangeNotifierProvider(
            create: (_) => settingsViewModel,
          ),
        ],
        child: MainWidget(
          router: mg_router,
        ));
  }
}

class MainWidget extends StatelessWidget {
  final GoRouter router;

  const MainWidget({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: Locale(context.watch<SettingsViewModel>().languageCode!),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeMode.light,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
