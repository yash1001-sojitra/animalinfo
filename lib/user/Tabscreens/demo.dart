// ignore_for_file: non_constant_identifier_names, camel_case_types, must_be_immutable

import 'package:animalinformation/logic/modules/animaldata_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../detailScreen/detailpage.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
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
                child: demolistmodel(
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

class demolistmodel extends StatelessWidget {
  demolistmodel(
      {required this.animalname,
      required this.animaltype,
      required this.src,
      Key? key})
      : super(key: key);
  String src;
  String animalname;
  String animaltype;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
      height: 190,
      child: Stack(children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/lodinggif.gif',
                image: src,
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
            height: 190,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.2), Colors.black54]),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  "     " + animaltype,
                  style: const TextStyle(color: Colors.white60, fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "    " + animalname,
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
