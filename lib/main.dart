import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import './styles/themes.dart';
import 'config/router/router.dart';
import 'features/core/auth/bloc/auth_cubit.dart';
import 'features/core/settings/bloc/settings_cubit.dart';
import 'features/dumy_feature/bloc/home_screen_cubit.dart';
import 'utils/services/local_storage/shared_preferences_helper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  setPathUrlStrategy();
  String languageCode = await SharedPreferencesHelper.getLanguageCode();
  String? token = await SharedPreferencesHelper.getToken();
  final AuthCubit authCubit = AuthCubit(token: token);
  final SettingsCubit settingsCubit = SettingsCubit(languageCode: languageCode);

  runApp(MyApp(
    authCubit: authCubit,
    settingsCubit: settingsCubit,
  ));
}

class MyApp extends StatelessWidget {
  late final SettingsCubit settingsCubit;
  late final AuthCubit authCubit;

  late final GoRouter mgRouter = GoRouter(
      initialLocation: '/',
      routes: appRoutes,
      routerNeglect: true,
      redirect: (context, routerState) {
        if (routerState.location == '/' && authCubit.state.authStatus != AuthCubitStatus.authenticated) {
          return '/login';
        }
        return null;
      });

  MyApp({Key? key, required this.settingsCubit, required this.authCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Example using .env file
    // print(dotenv.env['ESCAPED_DOLLAR_SIGN']);
    return MultiProvider(
        providers: [
          BlocProvider<HomeScreenCubit>(create: (context) => HomeScreenCubit()),
          BlocProvider<AuthCubit>(create: (context) => authCubit),
          BlocProvider<SettingsCubit>(
            create: (context) => settingsCubit,
          )
        ],
        child: MainWidget(
          router: mgRouter,
        ));
  }
}

class MainWidget extends StatelessWidget {
  final GoRouter router;

  const MainWidget({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previousState,currentState){
        return previousState.authStatus==AuthCubitStatus.authenticated && currentState.authStatus==AuthCubitStatus.unauthenticated;
      },
      listener: (context, state) {
        if(state.authStatus==AuthCubitStatus.unauthenticated){
          router.go('/login');
        }
      },
      child: MaterialApp.router(
        locale: Locale(context
            .watch<SettingsCubit>()
            .state
            .languageCode),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        themeMode: ThemeMode.light,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
