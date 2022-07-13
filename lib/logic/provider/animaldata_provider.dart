// ignore_for_file: non_constant_identifier_names

import 'package:animalinformation/logic/modules/animaldata_model.dart';
import 'package:animalinformation/logic/service/fireStoreServices/animal_firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AnimalDataProvider with ChangeNotifier {
  final service = AnimalDataFirestoreService();
  late String _animalname;
  late String _animaltype;
  late DateTime _time;
  late String _url;
  var uuid = const Uuid();

  // getter
  String get getAnimalName => _animalname;
  String get getAnimalType => _animaltype;
  DateTime get getTime => _time;
  String get getUrl => _url;

  //Setters:
  void changeAnimalName(String value) {
    _animalname = value;
    notifyListeners();
  }

  void changeAnimaltype(String value) {
    _animaltype = value;
    notifyListeners();
  }

  void changetime(DateTime time) {
    _time = time;
    notifyListeners();
  }

  void changeUrl(String url) {
    _url = url;
    notifyListeners();
  }

  void addFav(animalId,userId) {
    service.addFav(animalId, userId);
  }

   void removeFav(animalId,userId) {
    service.removeFav(animalId, userId);
  }


  void saveAnimalData() {
    var newAnimalData = AnimalData(
        id: uuid.v4(),
        favoriteList: [],
        animalName: _animalname,
        animalType: _animaltype,
        time: getTime,
        url: _url);
    service.saveAnimalData(newAnimalData);
  }

  void deleteAnimalData(AnimalId) {
    service.removeNotice(AnimalId);
  }

}
