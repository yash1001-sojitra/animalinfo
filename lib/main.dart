import 'package:animalinformation/splashscreen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Animals",
      home: const SplashScreen(),
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryIconTheme: const IconThemeData(color: Colors.white),
      ),
    ),
  );
}

// height: mediaquery.of(context).size.height

// TODO: setting section dark mode light mode
