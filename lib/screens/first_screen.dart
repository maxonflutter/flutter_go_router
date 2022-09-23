import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen #1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.go('/screen2'),
              child: const Text('Go to screen #2'),
            ),
          ],
        ),
      ),
    );
  }
}
