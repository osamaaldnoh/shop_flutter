import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/provider/cart.dart';
import 'package:shop_flutter/widget/cartitem_widget.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart_screen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, CartItem> _items = Provider.of<CartItems>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (_,i) => Divider(thickness: 1.5,height: 0,),
              itemCount: _items.length,
              itemBuilder: (_, i) => ChangeNotifierProvider.value(
                value: _items.values.toList()[i],
                child: CartItemWidget(_items.keys.toList()[i]),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total'),
                  Text('${Provider.of<CartItems>(context,listen: false).totalPrice}'),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {},
            height: 50,
            minWidth: double.infinity,
            color: Colors.blue,
            child: Text(
              'Order',
            ),
          ),
        ],
      ),
    );
  }
}
