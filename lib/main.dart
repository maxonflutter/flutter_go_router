import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/app_router.dart';
import 'cubit/cubit/login_cubit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            routerConfig: AppRouter(context.read<LoginCubit>()).router,
            title: 'GoRouter Example',
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
