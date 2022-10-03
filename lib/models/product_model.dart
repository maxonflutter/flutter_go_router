class Product {
  final String name;
  final String category;
  final int quantity;

  Product(this.name, this.category, this.quantity);

  static List<Product> products = [
    Product('Milk', 'Food', 10),
    Product('Rice', 'Food', 5),
    Product('Pasta', 'Food', 20),
    Product('Steak', 'Food', 15),
    Product('T-Shirt', 'Clothes', 2),
    Product('Jeans', 'Clothes', 5),
    Product('Shirt', 'Clothes', 10),
    Product('Skirt', 'Clothes', 20),
  ];
}
