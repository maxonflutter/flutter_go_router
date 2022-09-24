import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../main.dart';

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
                // log a user in, letting all the listeners know
                context.read<LoginInfo>().login('test-user');

                // router will automatically redirect from /login to / using
                // refreshListenable
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
