import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../Model/ProductModel.dart';

class FavProductProvider extends ChangeNotifier {
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
    if (product.isInCart == true) {
      _CartProductList.add(product);
    } else {
      _CartProductList.remove(product);
    }
    notifyListeners();
  }
}
