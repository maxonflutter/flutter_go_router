import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: ListView(
        children: <Widget>[
          for (final String fid in ['f1', 'f2'])
            ListTile(
              title: const Text('Test'),
              onTap: () {
                return context.go(
                  context.namedLocation(
                    'family',
                    params: <String, String>{'fid': fid},
                  ),
                );
              },
            )
        ],
      ),
    );
  }
}
