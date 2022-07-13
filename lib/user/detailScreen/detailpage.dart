import 'package:animalinformation/logic/provider/animaldata_provider.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../logic/modules/animaldata_model.dart';
import '../homescreen/drawer.dart';

class Detailspage extends StatefulWidget {
  const Detailspage({Key? key}) : super(key: key);

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    final categoryview =
        ModalRoute.of(context)!.settings.arguments as AnimalData;
    final animalProvider = Provider.of<AnimalDataProvider>(context);
    return Scaffold(
      drawer: const Drawerbtn(),
      drawerEnableOpenDragGesture: true,
      backgroundColor: const Color(0xff1a1a1a),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: const Color(0xff1a1a1a),
                  child: IconButton(
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
              ),
              iconTheme: const IconThemeData(color: Colors.white),
              pinned: false,
              backgroundColor: Colors.grey,
              expandedHeight: 240,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  categoryview.animalName,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    FadeInImage.assetNetwork(
                      placeholder: 'assets/lodinggif.gif',
                      image: categoryview.url,
                      fit: BoxFit.cover,
                    ),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.0, 0.55),
                          end: Alignment.center,
                          colors: <Color>[
                            Color.fromARGB(142, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(118, 26, 26, 26),
                    child: Center(
                      child: FavoriteButton(
                        isFavorite: categoryview.favoriteList.contains(user!.uid)?true:false,
                        iconSize: 40,
                        // iconDisabledColor: Colors.white,
                        valueChanged: (_isFavorite) {
                          _isFavorite
                              ? animalProvider.addFav(
                                  categoryview.id, user.uid)
                              : animalProvider.removeFav(
                                  categoryview.id, user.uid);
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 7,
                )
              ],
            ),
          ],
          body: const SafeArea(
            child: Text(" "),
          ),
        ),
      ),
    );
  }
}
