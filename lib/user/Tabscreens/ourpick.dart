import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/modules/animaldata_model.dart';
import '../detailScreen/detailpage.dart';
import '../models/animaldatalist_model.dart';

class Ourpick extends StatefulWidget {
  const Ourpick({Key? key}) : super(key: key);

  @override
  State<Ourpick> createState() => _OurpickState();
}

class _OurpickState extends State<Ourpick> {
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
        : const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
  }
}
