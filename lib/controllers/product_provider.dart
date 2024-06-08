import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/sneaker_model.dart';
import 'package:flutter_application_1/services/helper.dart';

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
    Map<String, dynamic> sizeData = _shoeSizes[index];
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

  void getShoes(String category, String id) {
    if (category == "Nike") {
      sneaker = Helper().getNikeListById(id);
    } else if (category == "Mizuno") {
      sneaker = Helper().getMizunoListById(id);
    } else {
      sneaker = Helper().getAdidasListById(id);
    }
  }
}
