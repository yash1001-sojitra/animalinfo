import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../logic/modules/animaldata_model.dart';
import '../homescreen/drawer.dart';

class Detailspage extends StatefulWidget {
  const Detailspage({
    Key? key,
  }) : super(key: key);

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  @override
  Widget build(BuildContext context) {
    final categoryview =
        ModalRoute.of(context)!.settings.arguments as AnimalData;
    return Scaffold(
      drawer: const Drawerbtn(),
      drawerEnableOpenDragGesture: true,
      backgroundColor: const Color(0xff1a1a1a),
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: const Color(0xff1a1a1a),
                        child: IconButton(
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
                      ),
                    ),
                    iconTheme: const IconThemeData(color: Colors.white),
                    pinned: false,
                    backgroundColor: Colors.grey,
                    expandedHeight: 240,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        categoryview.animalName,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      background: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          FadeInImage.assetNetwork(
                            placeholder: 'assets/lodinggif.gif',
                            image: categoryview.url,
                            fit: BoxFit.cover,
                          ),
                          const DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.0, 0.55),
                                end: Alignment.center,
                                colors: <Color>[
                                  Color.fromARGB(142, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      Builder(
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: const Color(0xff1a1a1a),
                              child: IconButton(
                                  splashColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onPressed: () =>
                                      Scaffold.of(context).openDrawer(),
                                  icon: SvgPicture.asset(
                                    "assets/icons/drawer.svg",
                                    height: 30,
                                    width: 35,
                                    color: Colors.white,
                                  )),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
            body: const SafeArea(
              child: Text(" "),
            )),
      ),
    );
  }
}

class BackgroundImageappbar extends StatelessWidget {
  BackgroundImageappbar({
    required this.src,
    Key? key,
  }) : super(key: key);
  String src;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Colors.black, Colors.black12],
        begin: Alignment.bottomCenter,
        end: Alignment.center,
      ).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(src),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
          ),
        ),
      ),
    );
  }
}
