import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/sneaker_model.dart';
import 'package:flutter_application_1/services/products_helper.dart';

class ProductNotifier extends ChangeNotifier {
  int _activePage = 0;
  List<dynamic> _shoeSizes = [];
  List<String> _sizes = [];

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
    shoeSizes[index]['isSelected'] = !shoeSizes[index]['isSelected'];
    notifyListeners();
  }

  List<String> get sizes => _sizes;

  set sizes(List<String> newSizes) {
    _sizes = newSizes;
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
