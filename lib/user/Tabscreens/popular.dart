import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../logic/modules/animaldata_model.dart';
import '../detailScreen/detailpage.dart';
import '../models/animaldatalist_model.dart';

class PopularAnimal extends StatefulWidget {
  const PopularAnimal({Key? key}) : super(key: key);

  @override
  State<PopularAnimal> createState() => _PopularAnimalState();
}

class _PopularAnimalState extends State<PopularAnimal> {
  @override
  Widget build(BuildContext context) {
    final animalList = Provider.of<List<AnimalData>?>(context);
    return animalList != null
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
        : const CircularProgressIndicator(
            color: Colors.white,
          );
  }
}
