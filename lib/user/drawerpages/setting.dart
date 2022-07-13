import 'package:animalinformation/user/drawerpages/about.dart';
import 'package:flutter/material.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({Key? key}) : super(key: key);

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  int groupValue = 1;
  List<String> subTitle = ["French", "English", "Spanish"];
  String name = "John";
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const ListTile(
                title: Text(
                  "Common",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const ListTile(
                subtitle: Text("English",
                    style: TextStyle(
                      color: Colors.grey,
                    )),
                leading: Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                ),
                title: Text(
                  "Language",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.format_paint,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Change Theme",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Divider(
                color: Colors.grey,
              ),
              const ListTile(
                title: Text(
                  "Notification",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Enable Notification",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                      Switch(value: true, onChanged: (vlaue) {}),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const About()));
                  },
                  child: Row(
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.info,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "About Us",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
