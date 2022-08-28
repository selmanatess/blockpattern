import 'package:block_pattern_sample/Bloc/cart_bloc.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sepet")),
      body: StreamBuilder(
        stream: cartblock.getStream,
        builder: (context, AsyncSnapshot snapshot) {
          return buildCart(snapshot);
        },
      ),
    );
  }

  Widget buildCart(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data?.length ?? 0,
      itemBuilder: (context, index) {
        final cart = snapshot.data;
        return ListTile(
            title: Text(
              cart[index].product.name,
            ),
            subtitle: Text(cart[index].product.price.toString()),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: (() {
                cartblock.removeFromCart(cart[index]);
              }),
            ));
      },
    );
  }
}
