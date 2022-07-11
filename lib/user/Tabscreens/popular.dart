import 'package:flutter/material.dart';

import '../detailScreen/detailpage.dart';
import '../helper/utils.dart';
import '../models/category.dart';
import '../models/categorycard.dart';

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
