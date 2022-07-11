import 'package:flutter/material.dart';

import '../helper/utils.dart';
import '../models/category.dart';
import '../models/categorycard.dart';

class atozcategorycard extends StatefulWidget {
  Category category;
  atozcategorycard(this.category, {Key? key}) : super(key: key);

  @override
  State<atozcategorycard> createState() => _atozcategorycardState();
}

class _atozcategorycardState extends State<atozcategorycard> {
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

  @override
  Widget build(BuildContext context) {
    List<Category> categories = Utils.getMockedCategories();

    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
      height: 190,
      child: _isLoading
          ? ListView.separated(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return const NewsCardSkelton();
              },
              separatorBuilder: (context, index) => const SizedBox(height: 20),
            )
          : Stack(children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/lodinggif.gif',
                      image: widget.category.imagename,
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
                        colors: [
                          Colors.black.withOpacity(0.2),
                          Colors.black54
                        ]),
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
                        "     " + widget.category.species,
                        style: const TextStyle(
                            color: Colors.white60, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "    " + widget.category.animalName,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
    );
  }
}