// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:english_words/english_words.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../Tabscreens/categorytab.dart';
import '../Tabscreens/demo.dart';
import '../Tabscreens/ourpick.dart';
import '../Tabscreens/popular.dart';
import '../listview/categorieslistview.dart';
import 'drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final style = const TextStyle(fontSize: 20);

  String? _result;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            drawerEnableOpenDragGesture: true,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: Builder(builder: (context) {
                return IconButton(
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: SvgPicture.asset(
                      "assets/icons/search.svg",
                      height: 22,
                      width: 30,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      var result = await showSearch<String>(
                        context: context,
                        delegate: CustomDelegate(),
                      );
                      setState(() => _result = result);
                    });
              }),
              elevation: 0,
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
              flexibleSpace: Container(
                decoration: const BoxDecoration(color: Color(0xff1a1a1a)),
              ),
            ),
            drawer: const Drawerbtn(),
            body: Container(
              color: Colors.black,
              child: Column(
                children: [
                  Container(
                    height: 110,
                    decoration: const BoxDecoration(
                      color: Color(0xff1a1a1a),
                    ),
                    child: SizedBox(
                      height: 50,
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0),
                            child: Text(
                              "Discover",
                              style: GoogleFonts.playfairDisplay(
                                  textStyle: style,
                                  letterSpacing: 1,
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          TabBar(
                            padding: const EdgeInsets.only(
                                top: 20, left: 20, right: 30),
                            indicator: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.white24,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            isScrollable: true,
                            labelColor: Colors.white,
                            labelPadding: const EdgeInsets.only(
                                left: 30, right: 30, top: 5, bottom: 5),
                            unselectedLabelColor: Colors.white38,
                            tabs: const [
                              Text(
                                "POPULAR",
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                "A TO Z",
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                "OUR PICK",
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                "CATEGORY",
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                "DEMO",
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: TabBarView(
                    // controller: _controller,
                    children: [
                      StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                          stream: FirebaseFirestore.instance
                              .collection("MAMMALS")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              // print(snapshot.data!.docs.first['AnimalName']);
                              return const PopularAnimal(); //popular
                            }
                          }),
                      StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                          stream: FirebaseFirestore.instance
                              .collection("MAMMALS")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              // print(snapshot.data!.docs.first['AnimalName']);
                              return const Atozcategorypage(); //A to Z
                            }
                          }),
                      StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                          stream: FirebaseFirestore.instance
                              .collection("Ourpick")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              // print(snapshot.data!.docs.first['AnimalName']);
                              return const Ourpick(); //Our pick
                            }
                          }),

                      const Categorytab(), //Catagory

                      const Demo(),
                    ],
                  ))
                ],
              ),
            )));
  }
}

class CustomDelegate extends SearchDelegate<String> {
  List<String> data = nouns.take(100).toList();

  @override
  List<Widget> buildActions(BuildContext context) =>
      [IconButton(icon: const Icon(Icons.clear), onPressed: () => query = '')];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
      icon: const Icon(Icons.chevron_left),
      onPressed: () => close(context, ''));

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> listToShow;
    if (query.isNotEmpty) {
      listToShow =
          data.where((e) => e.contains(query) && e.startsWith(query)).toList();
    } else {
      listToShow = data;
    }

    return ListView.builder(
      itemCount: listToShow.length,
      itemBuilder: (_, i) {
        var noun = listToShow[i];
        return ListTile(
          title: Text(noun),
          onTap: () => close(context, noun),
        );
      },
    );
  }
}
