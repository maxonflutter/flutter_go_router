import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FamilyScreen extends StatelessWidget {
  const FamilyScreen({
    Key? key,
    required this.fid,
  }) : super(key: key);

  final String fid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fid),
      ),
      body: ListView(
        children: <Widget>[
          for (final String pid in ['p1', 'p2'])
            ListTile(
              title: Text('$pid + Test'),
              onTap: () {
                return context.go(
                  context.namedLocation(
                    'person',
                    params: <String, String>{'pid': pid},
                    queryParams: <String, String>{'qid': 'quid'},
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
