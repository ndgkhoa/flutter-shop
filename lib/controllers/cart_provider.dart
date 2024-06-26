import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart/get_products.dart';

class CartProvider with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    if (_counter >= 1) {
      _counter--;
      notifyListeners();
    }
  }

  int? _productIndex;

  int get productIndex => _productIndex ?? 0;

  set setProductIndex(int newState) {
    _productIndex = newState;
    notifyListeners();
  }

  List<Product> _checkout = [];

  List<Product> get checkout => _checkout;

  set setCheckoutList(List<Product> newState) {
    _checkout = newState;
    notifyListeners();
  }
}
