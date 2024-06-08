import 'package:flutter_application_1/models/sneaker_model.dart';
import 'package:flutter_application_1/services/config.dart';
import 'package:http/http.dart' as http;

class Helper {
  static var client = http.Client();

  Future<List<Sneakers>> getNikeList() async {
    final url = Uri.http(Config.apiUrl, Config.sneakers);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      final list = sneakersFromJson(response.body);
      var nikeList = list.where((element) => element.category == "Nike");
      return nikeList.toList();
    } else {
      throw Exception("Failed to get sneakers list");
    }
  }

  Future<List<Sneakers>> getMizunoList() async {
    final url = Uri.http(Config.apiUrl, Config.sneakers);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      final list = sneakersFromJson(response.body);
      var mizunoList = list.where((element) => element.category == "Mizuno");
      return mizunoList.toList();
    } else {
      throw Exception("Failed to get sneakers list");
    }
  }

  Future<List<Sneakers>> getAdidasList() async {
    final url = Uri.http(Config.apiUrl, Config.sneakers);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      final list = sneakersFromJson(response.body);
      var adidasList = list.where((element) => element.category == "Adidas");
      return adidasList.toList();
    } else {
      throw Exception("Failed to get sneakers list");
    }
  }

  Future<List<Sneakers>> search(String searchQuery) async {
    final url = Uri.http(Config.apiUrl, "${Config.search}$searchQuery");
    var response = await client.get(url);
    if (response.statusCode == 200) {
      final results = sneakersFromJson(response.body);
      return results;
    } else {
      throw Exception("Failed to get sneakers list");
    }
  }
}
