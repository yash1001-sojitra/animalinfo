import 'package:animalinformation/logic/modules/animaldata_model.dart';
import 'package:animalinformation/user/detailScreen/detailpage.dart';
import 'package:animalinformation/user/models/animaldatalist_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    List<AnimalData> animalList = [];
     final complaintListRaw = Provider.of<List<AnimalData>?>(context);
      complaintListRaw?.forEach((element) {
      if ( element.favoriteList.contains(auth.currentUser?.uid ) ) {
        animalList.add(element);
      }
      ;
    });
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: const Text(
            "Favourite",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: const Color(0xff2a2a2a),
        body: animalList != null
        ? ListView.builder(
            itemCount: animalList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Detailspage(),
                      settings: RouteSettings(
                        arguments: animalList[index],
                      ),
                    ),
                  );
                },
                child: AnimalDataListModel(
                    animalname: animalList[index].animalName,
                    animaltype: animalList[index].animalType,
                    src: animalList[index].url),
              );
            })
        : const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
          );
  }
}
