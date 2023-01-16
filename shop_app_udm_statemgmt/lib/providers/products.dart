import 'package:flutter/material.dart';
import 'package:shop_app_udm_statemgmt/providers/providers.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Pizza',
      description: 'extra cheese Pizza .',
      price: 89.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2021/07/19/16/04/pizza-6478478_1280.jpg',
    ),
    Product(
      id: 'p6',
      title: 'Watch',
      description: 'a wall Watch .',
      price: 99.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2021/12/19/10/42/old-6880626_1280.jpg',
    ),
    Product(
      id: 'p7',
      title: 'Mug',
      description: 'a small Mug .',
      price: 20.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2022/01/06/23/43/coffee-6920499_1280.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Apple',
      description: 'fruits Apple',
      price: 80.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2021/10/25/14/45/apples-6741164_1280.jpg',
    ),
    Product(
      id: 'p9',
      title: 'Peanuts',
      description: 'delicious Peanuts',
      price: 50.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2022/01/06/11/30/peanuts-6919261_1280.jpg',
    ),
    Product(
      id: 'p10',
      title: 'Burger',
      description: 'delicious Hamburger',
      price: 60.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2020/10/05/19/55/hamburger-5630646_1280.jpg',
    ),
    Product(
      id: 'p11',
      title: 'ColdDrink',
      description: 'delicious ColdDrink',
      price: 30.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2021/10/24/14/40/drink-6738301_1280.jpg',
    ),
    Product(
      id: 'p12',
      title: 'Biscuits',
      description: 'delicious Biscuits',
      price: 10.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2022/01/12/09/29/ladyfinger-6932354_1280.jpg',
    ),
  ];

  // var _showFavoritesOnly = false;
  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
