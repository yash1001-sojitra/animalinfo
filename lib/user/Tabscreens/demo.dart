import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../detailScreen/detailpage.dart';
import '../helper/utils.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  List categories = Utils.getMockedCategories();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream:
                  FirebaseFirestore.instance.collection('MAMMALS').snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    'Error = ${snapshot.error}',
                    style: const TextStyle(color: Colors.white),
                  );
                }

                if (snapshot.hasData) {
                  final docs = snapshot.data!.docs;
                  return ListView.builder(
                    itemBuilder: (_, i) {
                      final docsdata = docs[i].data();
                      return GestureDetector(
                        child: Text("$docsdata"),
                        // CategoryCard(categories[i]),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Detailspage(),
                              settings: RouteSettings(
                                arguments: categories[i],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    itemCount: docs.length,
                  );
                }
                return const Center(child: CircularProgressIndicator());
              }),
        ),
      ],
    );
  }
}
