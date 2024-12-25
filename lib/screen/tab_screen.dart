import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/provider/cart.dart';
import 'package:shop_flutter/screen/cart_screen.dart';
import 'package:shop_flutter/screen/favorite_screen.dart';
import 'package:shop_flutter/screen/products_screen.dart';
import 'package:shop_flutter/widget/badge.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Map<String, dynamic>> _pages;

  int _currentIndex = 0;
  void _changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'title': 'Products',
        'body': ProductsScreen(),
      },
      {
        'title': 'Favorites',
        'body': const FavoritesScreen(),
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    int count = Provider.of<CartItems>(context).itemsCount;
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_currentIndex]['title']),
        actions: [
          Badge(
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
                icon: Icon(Icons.shopping_cart_outlined),
              ),
              value: count.toString()),
        ],
      ),
      body: _pages[_currentIndex]['body'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          onTap: _changeIndex,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                ),
                label: 'Category'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: 'Favorite')
          ]),
    );
  }
}
