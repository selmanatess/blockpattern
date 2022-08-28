import 'package:block_pattern_sample/Models/product.dart';

class ProductService {
  // ignore: deprecated_member_use
  static List<Product> products = [];
  static ProductService _singleton = ProductService._internal();
  ProductService._internal();
  factory ProductService() {
    return _singleton;
  }

  static List<Product> getAll() {
    products.add(new Product(1, "LEnovo Laptop", 7850));
    products.add(new Product(2, "ASUS Laptop", 13200));
    products.add(new Product(3, "Dell Laptop", 10500));
    return products;
  }
}
