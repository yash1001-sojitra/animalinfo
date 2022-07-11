// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AnimalDataListModel extends StatelessWidget {
  AnimalDataListModel(
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
