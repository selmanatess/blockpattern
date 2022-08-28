import 'package:block_pattern_sample/Bloc/cart_bloc.dart';
import 'package:block_pattern_sample/Bloc/product_bloc.dart';
import 'package:block_pattern_sample/Models/cart.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş"),
        actions: [
          IconButton(
              onPressed: (() => Navigator.pushNamed(context, "/cart")),
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: BuildProductList(),
    );
  }

  BuildProductList() {
    return StreamBuilder(
      initialData: ProductBloc.getAll(),
      stream: productblock.getStream,
      builder: ((context, AsyncSnapshot snapshot) {
        if (snapshot.data!.length > 0) {
          return buildproductListItems(snapshot);
        } else {
          return Center(
            child: Text("DATA YOK"),
          );
        }
      }),
    );
  }

  buildproductListItems(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          var list = snapshot.data;
          return ListTile(
            title: Text(list[index].name),
            subtitle: Text(list[index].price.toString()),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                cartblock.addToCart(Cart(list[index], 1));
              },
            ),
          );
        });
  }
}
