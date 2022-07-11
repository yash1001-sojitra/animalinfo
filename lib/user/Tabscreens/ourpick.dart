import 'package:animalinformation/models/category.dart';
import 'package:animalinformation/models/categorycard.dart';
import 'package:flutter/material.dart';

import '../detailScreen/detailpage.dart';
import '../helper/utils.dart';

class Ourpick extends StatefulWidget {
  const Ourpick({Key? key}) : super(key: key);

  @override
  State<Ourpick> createState() => _OurpickState();
}

class _OurpickState extends State<Ourpick> {
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
