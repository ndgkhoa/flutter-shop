import 'package:flutter/services.dart' as the_bundle;
import 'package:flutter_application_1/models/sneaker_model.dart';
import 'package:flutter_application_1/services/config.dart';
import 'package:http/http.dart' as http;

class Helper {
  static var client = http.Client();

  Future<List<Sneakers>> getNikeList() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/sneakers.json");
    final list = sneakersFromJson(data);
    var nikeList = list.where((element) => element.category == "Nike");
    return nikeList.toList();
  }

  Future<List<Sneakers>> getMizunoList() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/sneakers.json");
    final list = sneakersFromJson(data);
    var mizunoList = list.where((element) => element.category == "Mizuno");
    return mizunoList.toList();
  }

  Future<List<Sneakers>> getAdidasList() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/sneakers.json");
    final list = sneakersFromJson(data);
    var adidasList = list.where((element) => element.category == "Adidas");
    return adidasList.toList();
  }

  // Future<List<Sneakers>> getMaleSneakers() async {
  //   var url = Uri.http(Config.apiUrl, Config.sneakers);

  //   var response = await client.get(url);

  //   if (response.statusCode == 200) {
  //     final maleList = sneakersFromJson(response.body);
  //     var male = maleList.where((element) => element.category == "Men Running");
  //     return male.toList();
  //   } else {
  //     throw Exception("Failed to get sneakers list");
  //   }
  // }

  // Future<List<Sneakers>> getFemaleSneakers() async {
  //   var url = Uri.http(Config.apiUrl, Config.sneakers);

  //   var response = await client.get(url);

  //   if (response.statusCode == 200) {
  //     final femaleList = sneakersFromJson(response.body);
  //     var female =
  //         femaleList.where((element) => element.category == "Women Running");
  //     return female.toList();
  //   } else {
  //     throw Exception("Failed to get sneakers list");
  //   }
  // }

  // Future<List<Sneakers>> getKidsSneakers() async {
  //   var url = Uri.http(Config.apiUrl, Config.sneakers);

  //   var response = await client.get(url);

  //   if (response.statusCode == 200) {
  //     final kidsList = sneakersFromJson(response.body);
  //     var kids =
  //         kidsList.where((element) => element.category == "Kids Running");
  //     return kids.toList();
  //   } else {
  //     throw Exception("Failed to get sneakers list");
  //   }
  // }

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
