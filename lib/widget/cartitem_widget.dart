import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/provider/cart.dart';

class CartItemWidget extends StatelessWidget
{
  final String id;
  const CartItemWidget(this.id,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    CartItem _items = Provider.of(context);
    return Dismissible(
      key: ValueKey(id),
      onDismissed: (_) => Provider.of<CartItems>(context,listen: false).removeItem(id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
      ),
      child: ListTile(
        title: Text(_items.title),
        subtitle: Text('${_items.price * _items.quantity}'),
        trailing: Text('${_items.price.round()}x${_items.quantity}'),

      ),
    );

  }
}
