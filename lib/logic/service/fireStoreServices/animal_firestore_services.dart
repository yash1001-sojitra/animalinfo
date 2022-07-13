// ignore_for_file: non_constant_identifier_names

import 'package:animalinformation/logic/modules/animaldata_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnimalDataFirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveAnimalData(AnimalData animalData) {
    return _db
        .collection('AnimalData')
        .doc(animalData.id)
        .set(animalData.createMap());
  }

  Stream<List<AnimalData>> getAnimalData() {
    return _db
        .collection('AnimalData')
        .orderBy("time", descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => AnimalData.fromFirestore(document.data()))
            .toList());
  }

  Future<void> removeNotice(String AnimalId) {
    return _db.collection('AnimalData').doc(AnimalId).delete();
  }

  Future<void> addFav(String animalId,String userId) {
    return _db.collection('AnimalData').doc(animalId).update({
      'Fav' : FieldValue.arrayUnion([userId])
    });
  }

   Future<void> removeFav(String animalId,String userId) {
    return _db.collection('AnimalData').doc(animalId).update({
      'Fav' : FieldValue.arrayRemove([userId])
    });
  }
}
