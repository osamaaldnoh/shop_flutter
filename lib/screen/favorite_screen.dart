
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/widget/product_widget.dart';
import '../provider/product.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> prod = Provider.of<Products>(context).favProds;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          itemCount: prod.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            value: prod[i],
            child: ProductWidget(),
          )),
    );
  }
}

