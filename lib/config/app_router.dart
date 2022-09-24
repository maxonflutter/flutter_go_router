import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/screens.dart';

// This example shows how to use path parameters and query parameters.
// The route segments that start with ':' are treated as path
// parameters when defining GoRoute[s]. The parameter values can
// be accessed through GoRouterState.params.
// The query parameters are automatically stored in GoRouterState.queryParams.

final GoRouter router = GoRouter(
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
  ],
);
