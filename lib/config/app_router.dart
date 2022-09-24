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
        return const HomeScreen();
      },
    ),
    GoRoute(
      name: 'family',
      path: '/family/:fid',
      builder: (BuildContext context, GoRouterState state) {
        return FamilyScreen(fid: state.params['fid']!);
      },
    ),
    GoRoute(
      name: 'person',
      path: '/person/:pid',
      builder: (BuildContext context, GoRouterState state) {
        return PersonScreen(
          pid: state.params['pid']!,
        );
      },
    ),
  ],
);

// late final GoRouter router = GoRouter(
//   debugLogDiagnostics: true,
//   routes: <GoRoute>[
//     GoRoute(
//       name: 'home',
//       path: '/',
//       builder: (BuildContext context, GoRouterState state) {
//         return const HomeScreen();
//       },
//       routes: <GoRoute>[
//         GoRoute(
//           name: 'family',
//           path: 'family/:fid',
//           builder: (BuildContext context, GoRouterState state) {
//             return FamilyScreen(fid: state.params['fid']!);
//           },
//           routes: <GoRoute>[
//             GoRoute(
//               name: 'person',
//               path: 'person/:pid',
//               builder: (BuildContext context, GoRouterState state) {
//                 return PersonScreen(
//                   fid: state.params['fid']!,
//                   pid: state.params['pid']!,
//                 );
//               },
//             ),
//           ],
//         ),
//       ],
//     ),
//   ],
// );
