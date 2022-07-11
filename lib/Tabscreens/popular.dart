import 'package:animalinformation/detailScreen/detailpage.dart';
import 'package:animalinformation/helper/utils.dart';
import 'package:animalinformation/models/category.dart';
import 'package:animalinformation/models/categorycard.dart';
import 'package:flutter/material.dart';

class PopularAnimal extends StatefulWidget {
  const PopularAnimal({Key? key}) : super(key: key);

  @override
  State<PopularAnimal> createState() => _PopularAnimalState();
}

class _PopularAnimalState extends State<PopularAnimal> {
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
