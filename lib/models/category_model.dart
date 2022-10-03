import 'product_model.dart';

class Category {
  final String name;
  final List<Product> products;

  Category(this.name, this.products);

  static List<Category> categories = [
    Category(
      'Clothes',
      Product.products
          .where((product) => product.category == 'Clothes')
          .toList(),
    ),
    Category(
      'Food',
      Product.products.where((product) => product.category == 'Food').toList(),
    ),
  ];
}
