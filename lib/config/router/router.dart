import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../base/model_view_base.dart';
import 'pages/auth/login_page.dart';
import 'pages/auth/sign_up_page.dart';
import 'pages/home/detail_page.dart';
import 'pages/home/home_page.dart';

const _scaffoldKey = ValueKey<String>('App scaffold'); // shared key

final List<GoRoute> appRoutes = [
  GoRoute(path: '/login', name: 'login', builder: (context, state) => LoginPage(), routes: [
    GoRoute(path: 'registration', name: 'registration', builder: (context, state) => SignUpPage()),
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
        routes: <GoRoute>[
          // GoRoute(
          //   path: 'prvi',
          //   name: 'prvi',
          //   builder: (context, state) => DetailPage(),
          // )
        ]),
  ])
];
