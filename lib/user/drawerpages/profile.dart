// ignore_for_file: unused_local_variable
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../logic/modules/userData_model.dart';
import '../../logic/provider/userData_provider.dart';
import '../../logic/service/auth_services/auth_service.dart';

// ignore: camel_case_types
class profilepage extends StatefulWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  State<profilepage> createState() => _profilepageState();
}

// ignore: camel_case_types
class _profilepageState extends State<profilepage> {
  late File imageFile;
  PlatformFile? pickedFile;
  bool showLoading = false;

  Widget textfield({@required hintText}) {
    return Material(
      elevation: 3,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              letterSpacing: 2,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<UserData> userDataList = [];
    UserData? userData;
    final authService = Provider.of<AuthService>(context);
    User user = authService.getcurrentUser();
    final userprovider = Provider.of<UsereDataProvider>(context);
    final userDataListRaw = Provider.of<List<UserData>?>(context);
    userDataListRaw?.forEach((element) {
      if (user.uid == element.id) {
        userDataList.add(element);
      }
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        centerTitle: true,
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
          pickedFile != null
              ? GestureDetector(
                  onTap: () async {
                    setState(() {
                      showLoading = true;
                    });
                    progressIndicater(context, showLoading = true);
                    final ref = FirebaseStorage.instance
                        .ref()
                        .child('profileImg')
                        .child(pickedFile!.name.toString());
                    await ref.putFile(imageFile);
                    String url = await ref.getDownloadURL();
                    userprovider.changeUserimage(url);
                    userprovider.updateProfileImg(user.uid);
                    setState(() {
                      showLoading = false;
                      pickedFile = null;
                    });
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 28.0),
                    child: Center(
                        child: Text("Save", style: TextStyle(fontSize: 17))),
                  ))
              : const SizedBox(),
        ],
      ),
      backgroundColor: const Color(0xff2a2a2a),
      body: SafeArea(
        child: userDataList.isEmpty
            ? Container()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Center(
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.grey,
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  backgroundImage: pickedFile != null
                                      ? FileImage((File("${pickedFile!.path}")))
                                      : NetworkImage(
                                              userDataList.first.userimage)
                                          as ImageProvider,
                                  radius: 55,
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: buildCircle(
                                      all: 8,
                                      child: GestureDetector(
                                        onTap: () {
                                          selectFile();
                                        },
                                        child: const Icon(
                                          Icons.edit,
                                          color:
                                              Color.fromRGBO(64, 105, 225, 1),
                                          size: 20,
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Form(
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                textfield(
                                    hintText:
                                        'Name : ${userDataList.first.Name}'),
                                textfield(
                                    hintText:
                                        'Email : ${userDataList.first.email}')
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
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

  Widget buildCircle({
    required Widget child,
    required double all,
  }) =>
      ClipOval(
          child: Container(
        padding: EdgeInsets.all(all),
        color: Colors.white,
        child: child,
      ));
}
