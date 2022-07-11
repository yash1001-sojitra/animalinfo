import 'package:animalinformation/detailScreen/speciescategory.dart';
import 'package:animalinformation/helper/utils.dart';
import 'package:animalinformation/models/category.dart';


import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Categorytab extends StatefulWidget {
  const Categorytab({Key? key}) : super(key: key);

  @override
  State<Categorytab> createState() => _CategorytabState();
}

class _CategorytabState extends State<Categorytab> {
  late bool _isLoading = true;
  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 6), () {
    setState(() {
      _isLoading = false;
    });
    // });
    super.initState();
  }

  // setValueToFirebase(List<speciescategory> spicesnames) {
  //   List<Category> categories = Utils.getMockedCategories();

  //   for (var i = 0; i < spicesnames.length; i++) {
  //     for (var j = 0; j < categories.length; j++) {
  //       if (categories[j].species == spicesnames[i].species) {
  //         FirebaseFirestore.instance
  //             .collection(spicesnames[i].species)
  //             .doc()
  //             .set({
  //           "AnimalName": categories[j].animalName,
  //           "imageName": categories[j].imagename,
  //         });
  //       }
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    List<Speciescategory> categories = SpeicesUtils.getMockedCategories();
    // setValueToFirebase(categories);
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Speicesdetailspage(),
                settings: RouteSettings(
                  arguments: categories[index],
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: _isLoading
                ? ListView.separated(
                    itemCount: categories.length,
                    itemBuilder: (context, index) => Image.asset(
                      'assets/lodinggif.gif',
                      fit: BoxFit.cover,
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                  )
                : Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/lodinggif.gif',
                              image: categories[index].imagename,
                              fit: BoxFit.cover,
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
                              categories[index].species,
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
    );
  }
}
