import 'dart:async';

import 'package:block_pattern_sample/Data/prouct_service.dart';
import 'package:block_pattern_sample/Models/product.dart';

class ProductBloc {
  final productStreamController = StreamController.broadcast();
  Stream get getStream => productStreamController.stream;
  static List<Product> getAll() {
    return ProductService.getAll();
  }
}

final productblock = ProductBloc();
