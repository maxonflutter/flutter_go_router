import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../cubit/cubit/login_cubit.dart';
import '../screens/screens.dart';

// This example shows how to use redirect to handle a sign-in flow.
// The GoRouter.redirect method is called before the app is navigate to a
// new page. You can choose to redirect to a different page by returning a
// non-null URL string.

class AppRouter {
  final LoginCubit loginCubit;
  AppRouter(this.loginCubit);

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
    redirect: (BuildContext context, GoRouterState state) {
      final bool loggedIn = loginCubit.state.status == AuthStatus.authenticated;
      final bool loggingIn = state.subloc == '/login';
      if (!loggedIn) {
        return loggingIn ? null : '/login';
      }
      if (loggingIn) {
        return '/';
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(loginCubit.stream),
  );
}

// https://github.com/flutter/flutter/issues/108128
// https://github.com/csells/go_router/discussions/122
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

// class AppRouter {
//   final LoginInfo loginInfo;
//   AppRouter(this.loginInfo);

//   late final GoRouter router = GoRouter(
//     debugLogDiagnostics: true,
//     routes: <GoRoute>[
//       GoRoute(
//         name: 'home',
//         path: '/',
//         builder: (BuildContext context, GoRouterState state) {
//           return const CategoryScreen();
//         },
//         routes: [
//           GoRoute(
//             name: 'product_list',
//             path: 'product_list/:category',
//             builder: (BuildContext context, GoRouterState state) {
//               return ProductListScreen(
//                 category: state.params['category']!,
//                 asc: state.queryParams['sort'] == 'asc',
//                 quantity: int.parse(state.queryParams['filter'] ?? '0'),
//               );
//             },
//           ),
//         ],
//       ),
//       GoRoute(
//         path: '/login',
//         builder: (BuildContext context, GoRouterState state) =>
//             const LoginScreen(),
//       ),
//     ],
// // redirect to the login page if the user is not logged in
//     redirect: (BuildContext context, GoRouterState state) {
//       // if the user is not logged in, they need to login
//       final bool loggedIn = loginInfo.loggedIn;
//       final bool loggingIn = state.subloc == '/login';
//       if (!loggedIn) {
//         return loggingIn ? null : '/login';
//       }

//       // if the user is logged in but still on the login page, send them to
//       // the home page
//       if (loggingIn) {
//         return '/';
//       }

//       // no need to redirect at all
//       return null;
//     },

//     // changes on the listenable will cause the router to refresh it's route
//     refreshListenable: loginInfo,
//   );
// }
