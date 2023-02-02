// ignore_for_file: unnecessary_null_comparison

import 'package:animalinformation/logic/modules/animaldata_model.dart';
import 'package:animalinformation/user/detailScreen/detailpage.dart';
import 'package:animalinformation/user/models/animaldatalist_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
    final animalListRaw = Provider.of<List<AnimalData>?>(context);
    animalListRaw?.forEach((element) {
      if (element.favoriteList.contains(auth.currentUser?.uid)) {
        animalList.add(element);
      }
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
            ? StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: animalList.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8),
                  child: GestureDetector(
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                  borderRadius: BorderRadius.circular(20)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/lodinggif.gif',
                                  image: animalList[index].url,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.2),
                                      Colors.black54
                                    ]),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Center(
                                child: Text(
                                  animalList[index].animalName,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                staggeredTileBuilder: (int index) =>
                    StaggeredTile.count(2, index.isEven ? 3 : 2),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ));
  }
}
