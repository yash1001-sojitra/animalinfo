import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../homescreen/drawer.dart';
import '../models/category.dart';

class Detailspage extends StatefulWidget {
  const Detailspage({
    Key? key,
  }) : super(key: key);

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    final categorys = ModalRoute.of(context)!.settings.arguments as Category;
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
                          categorys.animalName,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        background: FadeInImage.assetNetwork(
                          placeholder: 'assets/lodinggif.gif',
                          image: categorys.imagename,
                          fit: BoxFit.cover,
                        )),
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
