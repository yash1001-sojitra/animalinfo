// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../logic/modules/animaldata_model.dart';
import '../detailScreen/detailpage.dart';
import '../models/animaldatalist_model.dart';

class atozcategory extends StatefulWidget {
  const atozcategory({Key? key}) : super(key: key);

  @override
  State<atozcategory> createState() => _atozcategoryState();
}

class _atozcategoryState extends State<atozcategory> {
  @override
  Widget build(BuildContext context) {
    final animalList = Provider.of<List<AnimalData>?>(context);
    return animalList != null
        ? ListView.builder(
            itemCount: animalList.length,
            itemBuilder: (context, index) {
              final sorteditems = animalList
                ..sort((item1, item2) =>
                    item1.animalName.compareTo(item2.animalName));
              final Categorysort = sorteditems[index];
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
                    animalname: Categorysort.animalName,
                    animaltype: Categorysort.animalType,
                    src: Categorysort.url),
              );
            })
        : const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
  }
}
