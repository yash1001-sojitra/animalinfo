class AnimalData {
  String id;
  String animalName;
  String animalType;
  late String url;
  DateTime time;
  List favoriteList;
  AnimalData({
    required this.id,
    required this.animalName,
    required this.animalType,
    required this.url,
    required this.time,
    required this.favoriteList,
  });

  Map<String, dynamic> createMap() {
    return {
      'Id': id,
      'AnimalName': animalName,
      'AnimalType': animalType,
      'url': url,
      'time': time,
      'Fav' : favoriteList,
    };
  }

  AnimalData.fromFirestore(Map<String, dynamic> firestoreMap)
      : id = firestoreMap['Id'],
        animalName = firestoreMap['AnimalName'],
        animalType = firestoreMap['AnimalType'],
        url = firestoreMap['url'],
        favoriteList = firestoreMap['Fav'],
        time = firestoreMap['time'].toDate();

  toList() {}
}
