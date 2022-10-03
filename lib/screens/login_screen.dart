import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubit/cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color(0xFF000A1F),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go(
                  context.namedLocation('home'),
                );
              },
              child: const Text('Go to Home'),
            ),
            ElevatedButton(
              onPressed: () {
                // router will automatically redirect from /login to / using
                // refreshListenable
                context.read<LoginCubit>().login();
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
