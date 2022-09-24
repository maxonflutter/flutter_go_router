import 'package:flutter/material.dart';
import 'package:flutter_go_router/main.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginInfo info = context.read<LoginInfo>();

    List<Category> categories = Category.categories;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: const Color(0xFF000A1F),
        actions: [
          IconButton(
            onPressed: info.logout,
            tooltip: 'Logout: ${info.userName}',
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          Category category = categories[index];

          return ListTile(
            title: Text(category.name),
            onTap: () {
              return context.go(
                context.namedLocation(
                  'product_list',
                  params: <String, String>{'category': category.name},
                  queryParams: <String, String>{'sort': 'desc', 'filter': '0'},
                ),
              );
            },
          );
        },
      ),
    );
  }
}
