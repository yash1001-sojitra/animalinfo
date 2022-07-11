import 'package:flutter/material.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({Key? key}) : super(key: key);

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: const Text(
            "Settings",
            style: TextStyle(color: Colors.white),
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
        ),
        backgroundColor: const Color(0xff2a2a2a),
        body: Center(
          child: Column(
            children: const [
              Text(
                "Rating",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "Color theme",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "About us",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ));
  }
}
