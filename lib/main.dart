import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/provider/cart.dart';
import 'package:shop_flutter/provider/product.dart';
import 'package:shop_flutter/screen/cart_screen.dart';
import 'package:shop_flutter/screen/tab_screen.dart';

void main()
{
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products(),),
        ChangeNotifierProvider.value(value: CartItems(),),
      ],

      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (_) => const TabScreen(),
          CartScreen.routeName: (_) => const CartScreen(),
        },
      ),
    );
  }
}
