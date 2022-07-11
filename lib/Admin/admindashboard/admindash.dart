// ignore_for_file: deprecated_member_use, non_constant_identifier_names

import 'dart:io';

import 'package:animalinformation/core/constant/textcontroller.dart';
import 'package:animalinformation/logic/provider/animaldata_provider.dart';
import 'package:animalinformation/user/homescreen/drawer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class Admindash extends StatefulWidget {
  const Admindash({Key? key}) : super(key: key);

  @override
  State<Admindash> createState() => _AdmindashState();
}

class _AdmindashState extends State<Admindash> {
  late File imageFile;
  PlatformFile? pickedFile;
  bool showLoading = false;
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final AnimaldataProvider = Provider.of<AnimalDataProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xff1a1a1a),
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Admin"),
        centerTitle: true,
        leading: Builder(builder: (context) {
          return IconButton(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Transform(
                transform: Matrix4.rotationY(math.pi),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  "assets/icons/drawer.svg",
                  height: 30,
                  width: 35,
                  color: Colors.white,
                ),
              ));
        }),
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: Color(0xff1a1a1a)),
        ),
      ),
      drawer: const Drawerbtn(),
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextFormField(
                        controller: animalnameController,
                        onChanged: (value) {
                          String Data = value.toUpperCase();
                          AnimaldataProvider.changeAnimalName(Data);
                        },
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Animal Name Here"),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextFormField(
                        controller: animaltypeController,
                        onChanged: (value) {
                          String Data = value.toUpperCase();
                          AnimaldataProvider.changeAnimaltype(Data);
                        },
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Animal Type Here"),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: pickedFile != null
                      ? Image.file(
                          (File("${pickedFile!.path}")),
                          height: 200,
                          width: MediaQuery.of(context).size.width * 0.80,
                        )
                      : Image.asset(
                          "assets/images/nodata.jpg",
                          height: 100,
                        ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 20),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        selectFile();
                      },
                      child: const Text(
                        "Add Attachment",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: pickedFile != null
                      ? Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.all(5),
                          color: Colors.blue[100],
                          child: Text(
                            pickedFile!.name,
                            softWrap: false,
                            overflow: TextOverflow.fade,
                            maxLines: 2,
                          ),
                        )
                      : const SizedBox(),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: RaisedButton(
                    onPressed: () async {
                      setState(() {
                        showLoading = true;
                      });
                      progressIndicater(context, showLoading = true);
                      final ref = FirebaseStorage.instance
                          .ref()
                          .child('url')
                          .child(pickedFile!.name.toString());
                      await ref.putFile(imageFile);
                      String url = await ref.getDownloadURL();
                      AnimaldataProvider.changeUrl(url);
                      AnimaldataProvider.changetime(DateTime.now());
                      AnimaldataProvider.saveAnimalData();
                      animalnameController.clear();
                      animaltypeController.clear();
                      setState(() {
                        showLoading = false;
                      });
                      Navigator.pop(context);
                    },
                    child: const Text("Submit Data"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;

      if (pickedFile != null) {
        imageFile = File(pickedFile!.path!);
      }
    });
  }

  Future<dynamic>? progressIndicater(BuildContext context, showLoading) {
    if (showLoading == true) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
    } else {
      return null;
    }
  }
}
