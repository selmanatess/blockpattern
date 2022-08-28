import 'dart:async';

import 'package:block_pattern_sample/Data/cart_service.dart';
import 'package:block_pattern_sample/Models/cart.dart';

class CartBloc {
  final cartStreamControoler = StreamController.broadcast();
  Stream get getStream => cartStreamControoler.stream;
  void addToCart(Cart item) {
    CartService.addToCart(item);
    cartStreamControoler.sink.add(CartService.getCart());
  }

  void removeFromCart(Cart item) {
    cartStreamControoler.sink.add(CartService.getCart());
  }

  List<Cart> getCart() {
    return CartService.getCart();
  }
}

final cartblock = CartBloc();
