import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/sneaker_model.dart';
import 'package:flutter_application_1/services/products_helper.dart';

class ProductNotifier extends ChangeNotifier {
  int _activePage = 0;
  List<dynamic> _shoeSizes = [];
  String _selectedSize = '';

  int get activePage => _activePage;

  set activePage(int newIndex) {
    _activePage = newIndex;
    notifyListeners();
  }

  List<dynamic> get shoeSizes => _shoeSizes;

  set shoeSizes(List<dynamic> newSizes) {
    _shoeSizes = newSizes;
    notifyListeners();
  }

  void toggleCheck(int index) {
    for (int i = 0; i < shoeSizes.length; i++) {
      shoeSizes[i]['isSelected'] = false;
    }
    shoeSizes[index]['isSelected'] = true;
    notifyListeners();
  }

  String get selectedSize => _selectedSize;

  set selectedSize(String newSizes) {
    _selectedSize = newSizes;
    notifyListeners();
  }

  late Future<List<Sneakers>> nike;
  late Future<List<Sneakers>> mizuno;
  late Future<List<Sneakers>> adidas;
  late Future<Sneakers> sneaker;

  void getNike() {
    nike = Helper().getNikeList();
  }

  void getMizuno() {
    mizuno = Helper().getMizunoList();
  }

  void getAdidas() {
    adidas = Helper().getAdidasList();
  }
}
