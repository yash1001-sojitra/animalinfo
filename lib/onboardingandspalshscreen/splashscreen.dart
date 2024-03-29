// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:animalinformation/Admin/admindashboard/admindash.dart';
import 'package:animalinformation/user/homescreen/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Authentication/signinpage.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int loginNum = 0;
  var emailAddress;
  @override
  void initState() {
    super.initState();
    checkUserType();
    Timer(
        const Duration(seconds: 5),
        () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => loginNum == 1
                      ? const Admindash()
                      : loginNum == 2
                          ? const HomePage()
                          : const SignInpage(),
                ),
              )
            });
  }

  checkUserType() {
    var auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((user) {
      if (user != null) {
        user = auth.currentUser;
        emailAddress = user!.email;
        if (emailAddress == 'admin@gmail.com') {
          setState(() {
            loginNum = 1;
          });
        } else {
          setState(() {
            loginNum = 2;
          });
        }
      } else {
        setState(() {
          loginNum = 3;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            color: Colors.transparent,
            child: Center(
              child: SizedBox(
                height: 60,
                width: 60,
                child: //CircularProgressIndicator(),
                    Lottie.asset('assets/lodingtrans.json'),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/animal.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
          ),
        ),
      ),
    );
  }
}
