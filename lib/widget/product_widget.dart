import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/provider/cart.dart';
import 'package:shop_flutter/provider/product.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product _product = Provider.of(context);
    return GridTile(
      child: Image.network(
        _product.imageUrl,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        leading: IconButton(
          onPressed: () {
            Provider.of<CartItems>(context,listen: false).addItem(
              _product.id,
              _product.title,
              _product.price,
            );
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${_product.title} Add to Cart!',
                  ),
                ),
            );
          },
          icon: Icon(Icons.add_shopping_cart),
        ),
        trailing: IconButton(
          onPressed: () {
            Provider.of<Products>(context, listen: false)
                .toggleFav(_product.id);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  _product.isFav
                      ? '${_product.title} Add to favorite!'
                      : '${_product.title} Removed from favorite!',
                ),
              ),
            );
          },
          icon: Icon(
            _product.isFav ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
        ),
        title: Center(child: Text(_product.title)),
      ),
    );
  }
}
