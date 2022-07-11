
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../Authentication/signinpage.dart';
import '../drawerpages/favourite.dart';
import '../drawerpages/profile.dart';
import '../drawerpages/setting.dart';

class Drawerbtn extends StatelessWidget {
  const Drawerbtn({Key? key}) : super(key: key);
  final style = const TextStyle(fontSize: 24);

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.25,
      child: Drawer(
        backgroundColor: const Color(0xff1a1a1a),
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const profilepage(),
                  ),
                );
              },
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Settingpage(),
                  ),
                );
              },
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Favourite(),
                  ),
                );
              },
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
              onTap: () {
                auth.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignInpage();
                    },
                  ),
                );
              },
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
    );
  }
}
