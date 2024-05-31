import 'package:flutter/services.dart' as the_bundle;
import 'package:flutter_application_1/models/sneaker_model.dart';

class Helper {
  Future<List<Sneakers>> getMaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");

    final maleList = SneakersFromJson(data);

    return maleList;
  }

  Future<List<Sneakers>> getFemaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");

    final femaleList = SneakersFromJson(data);

    return femaleList;
  }

  Future<List<Sneakers>> getKidsSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");

    final kidsList = SneakersFromJson(data);

    return kidsList;
  }

  Future<Sneakers> getMaleSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");

    final maleList = SneakersFromJson(data);

    final sneakers = maleList.firstWhere((sneaker) => sneaker.id == id);

    return sneakers;
  }

  Future<Sneakers> getFemaleSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");

    final femaleList = SneakersFromJson(data);

    final sneakers = femaleList.firstWhere((sneaker) => sneaker.id == id);

    return sneakers;
  }

  Future<Sneakers> getKidsSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");

    final kidsList = SneakersFromJson(data);

    final sneakers = kidsList.firstWhere((sneaker) => sneaker.id == id);

    return sneakers;
  }
}
