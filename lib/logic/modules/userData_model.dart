class UserData {
  String id;
  String Name;
  String email;
  String userimage;
  DateTime time;
  UserData(
      {
      required this.Name,
      required this.email,
      required this.id,
      required this.userimage,
      required this.time});

  Map<String, dynamic> createMap() {
    return {
      'id': id,
      'Name': Name,
      'Email': email,
      'UserImage': userimage,
      'time': time,
    };
  }

  UserData.fromFirestore(Map<String, dynamic>? firestoreMap)
      : id = firestoreMap!['id'],
        Name = firestoreMap['Name'],
        email = firestoreMap['Email'],
        userimage = firestoreMap['UserImage'],
        time = firestoreMap['time'].toDate();
}
