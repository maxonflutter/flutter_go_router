import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';
import '../screens/screens.dart';

// This example shows how to use redirect to handle a sign-in flow.
// The GoRouter.redirect method is called before the app is navigate to a
// new page. You can choose to redirect to a different page by returning a
// non-null URL string.

class AppRouter {
  final LoginInfo loginInfo;

  AppRouter(this.loginInfo);

  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        name: 'home',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const CategoryScreen();
        },
        routes: [
          GoRoute(
            name: 'product_list',
            path: 'product_list/:category',
            builder: (BuildContext context, GoRouterState state) {
              return ProductListScreen(
                category: state.params['category']!,
                asc: state.queryParams['sort'] == 'asc',
                quantity: int.parse(state.queryParams['filter'] ?? '0'),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) =>
            const LoginScreen(),
      ),
    ],
// redirect to the login page if the user is not logged in
    redirect: (BuildContext context, GoRouterState state) {
      // if the user is not logged in, they need to login
      final bool loggedIn = loginInfo.loggedIn;
      final bool loggingIn = state.subloc == '/login';
      if (!loggedIn) {
        return loggingIn ? null : '/login';
      }

      // if the user is logged in but still on the login page, send them to
      // the home page
      if (loggingIn) {
        return '/';
      }

      // no need to redirect at all
      return null;
    },

    // changes on the listenable will cause the router to refresh it's route
    refreshListenable: loginInfo,
  );
}
