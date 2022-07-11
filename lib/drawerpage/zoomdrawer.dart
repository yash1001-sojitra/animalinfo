import 'package:animalinformation/drawerpage/blackpage.dart';
import 'package:animalinformation/homescreen/drawer.dart';
import 'package:animalinformation/homescreen/homepage.dart';
import 'package:animalinformation/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:google_fonts/google_fonts.dart';

final ZoomDrawerController z = ZoomDrawerController();

class Zoom extends StatefulWidget {
  const Zoom({Key? key}) : super(key: key);
  @override
  _ZoomState createState() => _ZoomState();
}

class _ZoomState extends State<Zoom> {
  final style = const TextStyle(fontSize: 24);
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: z,
      borderRadius: 24,
      style: DrawerStyle.defaultStyle,
      showShadow: true,
      openCurve: Curves.fastOutSlowIn,
      slideWidth: MediaQuery.of(context).size.width * 0.75,
      duration: const Duration(milliseconds: 500),
      angle: 0.0,
      mainScreen: const HomePage(),
      menuScreen: Theme(
        data: ThemeData.dark(),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: EdgeInsets.only(left: 25),
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 300,
                    child: DrawerHeader(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          "assets/pngegg.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Profile',
                      style: GoogleFonts.playfairDisplay(
                          textStyle: style,
                          letterSpacing: 3,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Settings',
                      style: GoogleFonts.playfairDisplay(
                          textStyle: style,
                          letterSpacing: 3,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Favourite',
                      style: GoogleFonts.playfairDisplay(
                          textStyle: style,
                          letterSpacing: 3,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Log Out',
                      style: GoogleFonts.playfairDisplay(
                          textStyle: style,
                          letterSpacing: 3,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(500),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(500),
                      splashColor: Colors.black45,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black,
                        child: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                      child: const Center(
                        child: Text(
                          'v1.0.0',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: Color(0xffffffff),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
