

import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier{
  String id, title, description, imageUrl;
  double price;
  bool isFav;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.isFav = false,
  });

  void toggleFav()
  {
    isFav = !isFav;
  }
}

class Products with ChangeNotifier{
  final List<Product> _prods = [
    Product(
        id: '1',
        title: 'title_1',
        description: 'description 1',
        imageUrl: 'https://cdn.iconscout.com/icon/free/png-256/flutter-3629369-3032362.png',
        price: 12.0),
    Product(
        id: '2',
        title: 'title_2',
        description: 'description 2',
        imageUrl: 'https://cdn.iconscout.com/icon/free/png-256/flutter-3629369-3032362.png',
        price: 17.0),
    Product(
        id: '3',
        title: 'title_3',
        description: 'description 3',
        imageUrl: 'https://cdn.iconscout.com/icon/free/png-256/flutter-3629369-3032362.png',
        price: 15.0,
        isFav: true
    ),
  ];

  List<Product> get prods => [..._prods];

  List<Product> get favProds {
    return _prods.where((element) => element.isFav).toList();
  }

  void toggleFav(String id)
  {
    _prods.firstWhere((element) => element.id == id).toggleFav();
    notifyListeners();
  }

}
