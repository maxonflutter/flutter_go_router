import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/screens.dart';

// This example demonstrates how to navigate using named locations
// instead of URLs. Instead of hardcoding the URI locations,
// you can also use the named locations. To use this API, give
// a unique name to each GoRoute. The name can then be used in
// context.namedLocation to be translate back to the actual URL location.

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
          path: 'product_list',
          builder: (BuildContext context, GoRouterState state) {
            return const ProductListScreen();
          },
        ),
      ],
    ),
    // GoRoute(
    //   name: 'product_list',
    //   path: '/product_list',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return ProductListScreen();
    //   },
    // ),
  ],
);
