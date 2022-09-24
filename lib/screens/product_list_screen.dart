import 'package:flutter/material.dart';
import 'package:flutter_go_router/models/product_model.dart';
import 'package:go_router/go_router.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> products = Product.products;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        backgroundColor: const Color(0xFF000A1F),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: 'Sort the products asc/desc',
            icon: const Icon(Icons.sort),
          ),
          IconButton(
            onPressed: () {},
            tooltip: 'Filter the products',
            icon: const Icon(Icons.filter_alt),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          for (final Product product in products)
            ListTile(
              title: Text(product.name),
            ),
        ],
      ),
    );
  }
}
