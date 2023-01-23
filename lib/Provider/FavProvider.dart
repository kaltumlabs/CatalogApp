import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../Model/ProductModel.dart';

class FavProductProvider extends ChangeNotifier {
  void isBuy() {
    notifyListeners();
  }

  final List<Product> _favProductList = [];
  // HashSet<dynamic> favProductList = HashSet();
  List<Product> get favProductList => _favProductList;
  final List<Product> _CartProductList = [];
  // HashSet<dynamic> favProductList = HashSet();
  List<Product> get CartProductList => _CartProductList;

  void addToFavProduct(Product product) {
    if (product.isFavorite == true) {
      _favProductList.add(product);
    } else {
      _favProductList.remove(product);
    }
    notifyListeners();
  }

  void addToCartProduct(Product product) {
    _CartProductList.add(product);

    // _CartProductList.remove(product);

    notifyListeners();
  }

  void removeFromCartProduct(Product product) {
    _CartProductList.remove(product);

    notifyListeners();
  }
}
