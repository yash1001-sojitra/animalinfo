class AnimalData {
  String id;
  String animalName;
  String animalType;
  late String url;
  DateTime time;
  AnimalData({
    required this.id,
    required this.animalName,
    required this.animalType,
    required this.url,
    required this.time,
  });

  Map<String, dynamic> createMap() {
    return {
      'Id': id,
      'AnimalName': animalName,
      'AnimalType': animalType,
      'url': url,
      'time': time
    };
  }

  AnimalData.fromFirestore(Map<String, dynamic> firestoreMap)
      : id = firestoreMap['Id'],
        animalName = firestoreMap['AnimalName'],
        animalType = firestoreMap['AnimalType'],
        url = firestoreMap['url'],
        time = firestoreMap['time'].toDate();

  toList() {}
}
