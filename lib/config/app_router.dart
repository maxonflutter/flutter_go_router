import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/screens.dart';

// This is an example for a simple two-page app. The first route '/'
// is mapped to FirstScreen, and the second route '/screen2 is
// mapped to SecondScreen.
//
// To navigate between pages, press the buttons on the pages. The onPress
// callbacks use context.go() to navigate to another page. This is
// equivalent to entering url to the browser url bar directly.

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const CategoryScreen();
      },
      routes: [
        GoRoute(
          path: 'product_list',
          builder: (BuildContext context, GoRouterState state) {
            return const ProductListScreen();
          },
        ),
      ],
    ),
    // GoRoute(
    //   path: '/product_list',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return ProductListScreen();
    //   },
    // ),
  ],
);
