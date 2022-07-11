// ignore_for_file: non_constant_identifier_names


import 'package:animalinformation/models/category.dart';
import 'package:animalinformation/models/categorycard.dart';
import 'package:flutter/material.dart';

import '../Tabscreens/atoz.dart';
import '../detailScreen/detailpage.dart';
import '../helper/utils.dart';

class CategoryListpage extends StatefulWidget {
  const CategoryListpage({Key? key}) : super(key: key);

  @override
  State<CategoryListpage> createState() => _CategoryListpageState();
}

class _CategoryListpageState extends State<CategoryListpage> {
  List<Category> categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                child: CategoryCard(categories[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Detailspage(),
                      settings: RouteSettings(
                        arguments: categories[index],
                      ),
                    ),
                  );
                },
              );
            },
            itemCount: categories.length,
          ),
        ),
      ],
    );
  }
}

class Atozcategorypage extends StatefulWidget {
  const Atozcategorypage({Key? key}) : super(key: key);

  @override
  State<Atozcategorypage> createState() => _AtozcategorypageState();
}

class _AtozcategorypageState extends State<Atozcategorypage> {
  List<Category> categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              final sorteditems = categories
                ..sort((item1, item2) =>
                    item1.animalName.compareTo(item2.animalName));
              final Categorysort = sorteditems[index];
              return GestureDetector(
                child: atozcategorycard(Categorysort),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Detailspage(),
                      settings: RouteSettings(
                        arguments: categories[index],
                      ),
                    ),
                  );
                },
              );
            },
            itemCount: categories.length,
          ),
        ),
      ],
    );
  }
}
