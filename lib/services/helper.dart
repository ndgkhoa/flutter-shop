import 'package:flutter/services.dart' as the_bundle;
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

  Future<Sneakers> getNikeListById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/sneakers.json");
    final list = sneakersFromJson(data);
    var nikeList = list.where((element) => element.category == "Nike").toList();
    final sneakers = nikeList.firstWhere((sneaker) => sneaker.id == id);
    return sneakers;
  }

  Future<Sneakers> getMizunoListById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/sneakers.json");
    final list = sneakersFromJson(data);
    var mizunoList =
        list.where((element) => element.category == "Mizuno").toList();
    final sneakers = mizunoList.firstWhere((sneaker) => sneaker.id == id);
    return sneakers;
  }

  Future<Sneakers> getAdidasListById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/sneakers.json");
    final list = sneakersFromJson(data);
    var adidasList =
        list.where((element) => element.category == "Adidas").toList();
    final sneakers = adidasList.firstWhere((sneaker) => sneaker.id == id);
    return sneakers;
  }
}
