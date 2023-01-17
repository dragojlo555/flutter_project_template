import 'package:go_router/go_router.dart';
import 'pages/auth/login_page.dart';
import 'pages/auth/sign_up_page.dart';
import 'pages/home/detail_page.dart';
import 'pages/home/home_page.dart';

final List<GoRoute> appRoutes = [
  GoRoute(path: '/login', name: 'login', builder: (context, state) => const LoginPage(), routes: [
    GoRoute(path: 'registration', name: 'registration', builder: (context, state) => const SignUpPage()),
  ]),
  GoRoute(path: '/', name: 'home', builder: (context, state) => const HomePage(), routes: [
    GoRoute(
      path: 'detail/:id',
      name: 'detail',
      builder: (context, state) {
        return DetailPage(
          idUser: state.params['id'] ?? '0',
        );
      },
    ),
  ])
];
