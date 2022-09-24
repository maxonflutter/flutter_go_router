import 'package:flutter/material.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({
    Key? key,
    required this.pid,
  }) : super(key: key);

  final String pid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pid),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(pid),
          )
        ],
      ),
    );
  }
}
