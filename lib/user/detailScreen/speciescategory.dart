

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helper/utils.dart';
import '../homescreen/drawer.dart';
import '../models/category.dart';
import 'detailpage.dart';


class Speicesdetailspage extends StatefulWidget {
  const Speicesdetailspage({Key? key}) : super(key: key);

  @override
  State<Speicesdetailspage> createState() => _SpeicesdetailspageState();
}

class _SpeicesdetailspageState extends State<Speicesdetailspage> {
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

    final spicesname =
        ModalRoute.of(context)!.settings.arguments as Speciescategory;
    categories = categories
        .where((element) => element.species == spicesname.species)
        .toList();
    return Scaffold(
      backgroundColor: const Color(0xff1a1a1a),
      drawer: const Drawerbtn(),
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          spicesname.species,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, letterSpacing: 2),
        ),
        backgroundColor: const Color(0xff1a1a1a),
        leading: IconButton(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: SvgPicture.asset(
                    "assets/icons/drawer.svg",
                    height: 30,
                    width: 35,
                    color: Colors.white,
                  ));
            },
          ),
        ],
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.only(left: 6.0, top: 8, right: 6),
          child: GestureDetector(
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: _isLoading
                  ? ListView.separated(
                      itemCount: categories.length,
                      itemBuilder: (context, index) => Image.asset(
                        'assets/lodinggif.gif',
                        fit: BoxFit.cover,
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                    )
                  : Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(20)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/lodinggif.gif',
                                image: categories[index].imagename,
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
                            height: 300,
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
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                              child: Text(
                                categories[index].animalName,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(2, index.isEven ? 3 : 2),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
