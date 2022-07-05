import 'package:go_router/go_router.dart';

import 'pages/auth/login_page.dart';
import 'pages/auth/sign_up_page.dart';
import 'pages/home/detail_page.dart';
import 'pages/home/home_page.dart';

final List<GoRoute> PEAKRoutes = [
  GoRoute(path: '/login', name: 'login', builder: (context, state) => LoginPage(), routes: [
    GoRoute(path: 'registration', name: 'registration', builder: (context, state) => SignUpPage()),
  ]),
  GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => HomePage(),
      routes: [GoRoute(path: 'detail', name: 'detail', builder: (context, state) => DetailPage())])
];
