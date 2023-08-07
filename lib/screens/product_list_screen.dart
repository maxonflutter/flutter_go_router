import 'package:flutter/material.dart';
import 'package:flutter_go_router/models/product_model.dart';
import 'package:go_router/go_router.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({
    Key? key,
    required this.category,
    required this.asc,
    required this.quantity,
  }) : super(key: key);

  final String category;
  final bool asc;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final List<Product> products = Product.products
        .where((product) => product.category == category)
        .where((product) => product.quantity > quantity)
        .toList();
    products.sort(((a, b) => a.name.compareTo(b.name)));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category,
        ),
        backgroundColor: const Color(0xFF000A1F),
        actions: [
          IconButton(
            onPressed: () {
              String sort = asc ? 'desc' : 'asc';
              return context.goNamed(
                'product_list',
                pathParameters: <String, String>{'category': category},
                queryParameters: <String, String>{'sort': sort},
              );
            },
            tooltip: 'Sort the products asc/desc',
            icon: const Icon(Icons.sort),
          ),
          IconButton(
            onPressed: () {
              return context.goNamed(
                'product_list',
                pathParameters: <String, String>{'category': category},
                queryParameters: <String, String>{'filter': '10'},
              );
            },
            tooltip: 'Filter the products',
            icon: const Icon(Icons.filter_alt),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          for (final Product product in asc ? products : products.reversed)
            ListTile(
              title: Text(product.name),
            ),
        ],
      ),
    );
  }
}
